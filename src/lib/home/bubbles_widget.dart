import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'bubbles_painter.dart';
import 'bubbles_popup.dart';
import 'package:provider/provider.dart';


class BubbleData with ChangeNotifier {
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

  void updatePosition(double containerWidth, double containerHeight, double bubbleRadius) {
    top += dy;
    left += dx;

    // Check for wall collisions
    if (top <= 0 || top >= containerHeight - bubbleRadius * 2) {
      dy = -dy;
      top = top.clamp(0, containerHeight - bubbleRadius * 2);
    }
    if (left <= 0 || left >= containerWidth - bubbleRadius * 2) {
      dx = -dx;
      left = left.clamp(0, containerWidth - bubbleRadius * 2);
    }

    notifyListeners();
  }

  void remove() {
    isRemoved = true;
    notifyListeners();
  }
}


class BouncingBubble extends StatefulWidget {
  final BubbleData bubbleData;
  final double bubbleRadius;
  final Function onRemove;

  BouncingBubble({
    required this.bubbleData,
    required this.bubbleRadius,
    required this.onRemove,
  });

  @override
  _BouncingBubbleState createState() => _BouncingBubbleState();
}

class _BouncingBubbleState extends State<BouncingBubble> with TickerProviderStateMixin {
  late AnimationController lottieController;

  @override
  void initState() {
    super.initState();
    lottieController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  void _showPopup(BuildContext context) {
    if (!widget.bubbleData.isRemoved) {
      showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return BubblePopup(
            logoPath: widget.bubbleData.logoPath,
            onRemoveBubble: () {
              widget.bubbleData.isAnimating = true;
              lottieController.forward();

              lottieController.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  widget.onRemove(widget.bubbleData.id);
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
    return AnimatedPositioned(
      duration: Duration(milliseconds: 100),
      top: widget.bubbleData.top,
      left: widget.bubbleData.left,
      child: GestureDetector(
        onTap: () => _showPopup(context),
        child: widget.bubbleData.isAnimating
            ? Transform.translate(
                offset: Offset(-widget.bubbleRadius, -widget.bubbleRadius),
                child: Lottie.asset(
                  'assets/animation/bubble_popup.json',
                  width: widget.bubbleRadius * 4,
                  height: widget.bubbleRadius * 4,
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
                    painter: BubblePainter(bubbleRadius: widget.bubbleRadius),
                    child: Container(
                      width: widget.bubbleRadius * 2,
                      height: widget.bubbleRadius * 2,
                      child: Center(
                        child: Image.asset(widget.bubbleData.logoPath, width: widget.bubbleRadius, height: widget.bubbleRadius),
                      ),
                    ),
                  ),
      ),
    );
  }

  @override
  void dispose() {
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

class _BubblesWidgetState extends State<BubblesWidget> with SingleTickerProviderStateMixin {
  final double bubbleRadius = 50;
  final double bubbleRadiusWithBorder = 52;
  final List<BubbleData> allBubbles = [];
  late double containerWidth;
  late double containerHeight;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 100))
      ..addListener(_updateBubbles)
      ..repeat();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (allBubbles.isEmpty) {
      final screenSize = MediaQuery.of(context).size;
      containerWidth = screenSize.width;
      containerHeight = screenSize.height;

      for (int i = 0; i < widget.bubbleCount; i++) {
        bool isOverlapping;
        BubbleData newBubble;
        do {
          isOverlapping = false;
          double top = Random().nextDouble() * (containerHeight - bubbleRadiusWithBorder * 2);
          double left = Random().nextDouble() * (containerWidth - bubbleRadiusWithBorder * 2);
          double dx = 0.5 * (Random().nextBool() ? 1 : -1);
          double dy = 0.5 * (Random().nextBool() ? 1 : -1);

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

  void _updateBubbles() {
    setState(() {
      for (var bubble in allBubbles) {
        if (!bubble.isRemoved) {
          bubble.updatePosition(containerWidth, containerHeight, bubbleRadiusWithBorder);
        }
      }
      _handleCollisions();
    });
  }

  void _handleCollisions() {
    for (int i = 0; i < allBubbles.length; i++) {
      for (int j = i + 1; j < allBubbles.length; j++) {
        var bubbleA = allBubbles[i];
        var bubbleB = allBubbles[j];
        if (!bubbleA.isRemoved && !bubbleB.isRemoved) {
          double dx = bubbleB.left - bubbleA.left;
          double dy = bubbleB.top - bubbleA.top;
          double distance = sqrt(dx * dx + dy * dy);
          if (distance < bubbleRadiusWithBorder * 2) {
            double overlap = bubbleRadiusWithBorder * 2 - distance;
            double adjustX = (dx / distance) * overlap / 2;
            double adjustY = (dy / distance) * overlap / 2;

            bubbleA.left -= adjustX;
            bubbleA.top -= adjustY;
            bubbleB.left += adjustX;
            bubbleB.top += adjustY;

            double normalX = dx / distance;
            double normalY = dy / distance;

            double relativeVelocityX = bubbleA.dx - bubbleB.dx;
            double relativeVelocityY = bubbleA.dy - bubbleB.dy;
            double relativeVelocityNormal = relativeVelocityX * normalX + relativeVelocityY * normalY;

            double impulse = (2 * relativeVelocityNormal) / 2;  // Masses are assumed equal

            bubbleA.dx -= impulse * normalX;
            bubbleA.dy -= impulse * normalY;
            bubbleB.dx += impulse * normalX;
            bubbleB.dy += impulse * normalY;
          }
        }
      }
    }
  }

  void _removeBubble(String id) {
    setState(() {
      var bubble = allBubbles.firstWhere((b) => b.id == id);
      bubble.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        containerWidth = constraints.maxWidth;
        containerHeight = constraints.maxHeight;

        return Stack(
          children: allBubbles.map((bubbleData) {
            return ChangeNotifierProvider.value(
              value: bubbleData,
              child: BouncingBubble(
                bubbleData: bubbleData,
                bubbleRadius: bubbleRadius,
                onRemove: _removeBubble,
              ),
            );
          }).toList(),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
