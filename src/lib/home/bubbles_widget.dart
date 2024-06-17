import 'dart:math';
import 'package:flutter/material.dart';
import 'bubbles_painter.dart';
import 'bubbles_popup.dart';
import 'package:lottie/lottie.dart';

class BubbleData {
  final String id;
  double top;
  double left;
  double dx;
  double dy;
  final String logoPath;
  bool isRemoved = false;
  bool isAnimating = false;

  BubbleData({
    required this.id,
    required this.top,
    required this.left,
    required this.dx,
    required this.dy,
    required this.logoPath,
  });
}

class BouncingBubble extends StatefulWidget {
  final List<BubbleData> allBubbles;
  final BubbleData bubbleData;
  final double containerWidth;
  final double containerHeight;

  BouncingBubble({
    required this.allBubbles,
    required this.bubbleData,
    required this.containerWidth,
    required this.containerHeight,
  });

  @override
  _BouncingBubbleState createState() => _BouncingBubbleState();
}

class _BouncingBubbleState extends State<BouncingBubble> with TickerProviderStateMixin {
  late AnimationController movementController;
  late AnimationController lottieController;
  final double bubbleRadius = 50;
  final double bubbleRadiusWithBorder = 52;

  @override
  void initState() {
    super.initState();
    movementController = AnimationController(vsync: this, duration: Duration(milliseconds: 100))..repeat();
    lottieController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    movementController.addListener(_updateBubblePosition);
  }

  void _updateBubblePosition() {
    if (widget.bubbleData.isRemoved || widget.bubbleData.isAnimating) return;

    setState(() {
      widget.bubbleData.top += widget.bubbleData.dy;
      widget.bubbleData.left += widget.bubbleData.dx;

      if (widget.bubbleData.top <= 0 || widget.bubbleData.top >= widget.containerHeight - bubbleRadiusWithBorder * 2) {
        widget.bubbleData.dy = -widget.bubbleData.dy;
        widget.bubbleData.top = widget.bubbleData.top.clamp(0, widget.containerHeight - bubbleRadiusWithBorder * 2);
      }
      if (widget.bubbleData.left <= 0 || widget.bubbleData.left >= widget.containerWidth - bubbleRadiusWithBorder * 2) {
        widget.bubbleData.dx = -widget.bubbleData.dx;
        widget.bubbleData.left = widget.bubbleData.left.clamp(0, widget.containerWidth - bubbleRadiusWithBorder * 2);
      }

      _handleCollisions();
    });
  }

  void _handleCollisions() {
    for (var bubble in widget.allBubbles) {
      if (bubble != widget.bubbleData && !bubble.isRemoved) {
        double dx2 = bubble.left - widget.bubbleData.left;
        double dy2 = bubble.top - widget.bubbleData.top;
        double distance = sqrt(dx2 * dx2 + dy2 * dy2);
        if (distance < bubbleRadiusWithBorder * 2) {
          double overlap = bubbleRadiusWithBorder * 2 - distance;
          double adjustX = (dx2 / distance) * overlap / 2;
          double adjustY = (dy2 / distance) * overlap / 2;

          setState(() {
            widget.bubbleData.left -= adjustX;
            widget.bubbleData.top -= adjustY;
            bubble.left += adjustX;
            bubble.top += adjustY;

            double mass = 1;
            double normalX = dx2 / distance;
            double normalY = dy2 / distance;

            double relativeVelocityX = widget.bubbleData.dx - bubble.dx;
            double relativeVelocityY = widget.bubbleData.dy - bubble.dy;
            double relativeVelocityNormal = relativeVelocityX * normalX + relativeVelocityY * normalY;

            double impulse = (2 * relativeVelocityNormal) / (mass + mass);

            widget.bubbleData.dx -= impulse * normalX * mass;
            widget.bubbleData.dy -= impulse * normalY * mass;
            bubble.dx += impulse * normalX * mass;
            bubble.dy += impulse * normalY * mass;
          });
        }
      }
    }
  }

  void _showPopup(BuildContext context) {
    if (!widget.bubbleData.isRemoved) {
      showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return BubblePopup(
            logoPath: widget.bubbleData.logoPath,
            onRemoveBubble: () {
              setState(() {
                widget.bubbleData.isAnimating = true;
              });

              // Play the Lottie animation
              lottieController.forward();

              // Delay the removal of the bubble until after the Lottie animation has finished
              lottieController.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  setState(() {
                    widget.bubbleData.isRemoved = true;
                    widget.bubbleData.isAnimating = false;
                    widget.allBubbles.removeWhere((bubble) => bubble.id == widget.bubbleData.id);
                  });
                }
              });
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.bubbleData.top,
      left: widget.bubbleData.left,
      child: GestureDetector(
        onTap: () => _showPopup(context),
        child: widget.bubbleData.isAnimating
            ? Transform.translate(
                offset: Offset(-bubbleRadius, -bubbleRadius),
                child: Lottie.asset(
                  'assets/animation/bubble_popup.json',
                  width: bubbleRadius * 4,
                  height: bubbleRadius * 4,
                  controller: lottieController,
                  onLoaded: (composition) {
                    lottieController
                      ..duration = composition.duration
                      ..forward();
                  },
                ),
              )
            : widget.bubbleData.isRemoved
                ? Container()
                : CustomPaint(
                    painter: BubblePainter(bubbleRadius: bubbleRadius),
                    child: Container(
                      width: bubbleRadius * 2,
                      height: bubbleRadius * 2,
                      child: Center(
                        child: Image.asset(widget.bubbleData.logoPath, width: bubbleRadius, height: bubbleRadius),
                      ),
                    ),
                  ),
      ),
    );
  }

  @override
  void dispose() {
    movementController.dispose();
    lottieController.dispose();
    super.dispose();
  }
}

class BubblesWidget extends StatefulWidget {
  final int bubbleCount;
  final List<String> logos;

  BubblesWidget({required this.bubbleCount, required this.logos});

  @override
  _BubblesWidgetState createState() => _BubblesWidgetState();
}

class _BubblesWidgetState extends State<BubblesWidget> {
  final double bubbleRadius = 50;
  final double bubbleRadiusWithBorder = 52;
  final List<BubbleData> allBubbles = [];
  late double containerWidth;
  late double containerHeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (allBubbles.isEmpty) {
      final screenSize = MediaQuery.of(context).size;
      containerWidth = screenSize.width;
      containerHeight = screenSize.height;

      for (int i = 0; i < widget.bubbleCount; i++) {
        BubbleData newBubble;
        bool isOverlapping;
        do {
          isOverlapping = false;
          double top = Random().nextDouble() * (containerHeight - bubbleRadiusWithBorder * 2);
          double left = Random().nextDouble() * (containerWidth - bubbleRadiusWithBorder * 2);
          double dx = 0.1 * (Random().nextBool() ? 1 : -1);  // Slower speed
          double dy = 0.1 * (Random().nextBool() ? 1 : -1);  // Slower speed

          newBubble = BubbleData(
            id: UniqueKey().toString(),
            top: top,
            left: left,
            dx: dx,
            dy: dy,
            logoPath: widget.logos[i % widget.logos.length],
          );

          for (var bubble in allBubbles) {
            double dx2 = bubble.left - newBubble.left;
            double dy2 = bubble.top - newBubble.top;
            double distance = sqrt(dx2 * dx2 + dy2 * dy2);
            if (distance <= bubbleRadiusWithBorder * 2) {
              isOverlapping = true;
              break;
            }
          }
        } while (isOverlapping);

        allBubbles.add(newBubble);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        containerWidth = constraints.maxWidth;
        containerHeight = constraints.maxHeight;

        return Stack(
          children: allBubbles.map((bubbleData) {
            return BouncingBubble(
              allBubbles: allBubbles,
              bubbleData: bubbleData,
              containerWidth: containerWidth,
              containerHeight: containerHeight,
            );
          }).toList(),
        );
      },
    );
  }
}
