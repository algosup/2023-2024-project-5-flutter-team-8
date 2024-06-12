import 'dart:math';
import 'package:flutter/material.dart';
import 'bubbles_painter.dart';
import 'bubbles_popup.dart';

class BubbleData {
  double top;
  double left;
  double dx;
  double dy;
  final String logoPath;

  BubbleData({
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

class _BouncingBubbleState extends State<BouncingBubble> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  final double bubbleRadius = 40;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 16))..repeat();
    animationController.addListener(() {
      setState(() {
        widget.bubbleData.top += widget.bubbleData.dy;
        widget.bubbleData.left += widget.bubbleData.dx;

        // Check for boundaries and reverse direction if necessary
        if (widget.bubbleData.top <= 0 || widget.bubbleData.top >= widget.containerHeight - bubbleRadius * 2) {
          widget.bubbleData.dy = -widget.bubbleData.dy;
          widget.bubbleData.top = widget.bubbleData.top.clamp(0, widget.containerHeight - bubbleRadius * 2);
        }
        if (widget.bubbleData.left <= 0 || widget.bubbleData.left >= widget.containerWidth - bubbleRadius * 2) {
          widget.bubbleData.dx = -widget.bubbleData.dx;
          widget.bubbleData.left = widget.bubbleData.left.clamp(0, widget.containerWidth - bubbleRadius * 2);
        }

        // Check for collisions with other bubbles
        for (var bubble in widget.allBubbles) {
          if (bubble != widget.bubbleData) {
            double dx2 = bubble.left - widget.bubbleData.left;
            double dy2 = bubble.top - widget.bubbleData.top;
            double distance = sqrt(dx2 * dx2 + dy2 * dy2);
            if (distance < bubbleRadius * 2) {
              // Move bubbles apart to prevent overlapping
              double overlap = bubbleRadius * 2 - distance;
              double adjustX = (dx2 / distance) * overlap / 2;
              double adjustY = (dy2 / distance) * overlap / 2;

              widget.bubbleData.left -= adjustX;
              widget.bubbleData.top -= adjustY;
              bubble.left += adjustX;
              bubble.top += adjustY;

              // Reverse direction on collision
              widget.bubbleData.dx = -widget.bubbleData.dx;
              widget.bubbleData.dy = -widget.bubbleData.dy;
              bubble.dx = -bubble.dx;
              bubble.dy = -bubble.dy;
            }
          }
        }
      });
    });
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BubblePopup(logoPath: widget.bubbleData.logoPath);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.bubbleData.top,
      left: widget.bubbleData.left,
      child: GestureDetector(
        onTap: () => _showPopup(context),
        child: CustomPaint(
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
    animationController.dispose();
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
  final double bubbleRadius = 40;
  final List<BubbleData> allBubbles = [];
  late double containerWidth;
  late double containerHeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Create bubbles and store their data
    if (allBubbles.isEmpty) {
      final screenSize = MediaQuery.of(context).size;
      containerWidth = screenSize.width;
      containerHeight = screenSize.height;

      for (int i = 0; i < widget.bubbleCount; i++) {
        BubbleData newBubble;
        bool isOverlapping;
        do {
          isOverlapping = false;
          double top = Random().nextDouble() * (containerHeight - bubbleRadius * 2);
          double left = Random().nextDouble() * (containerWidth - bubbleRadius * 2);
          double dx = 0.2 * (Random().nextBool() ? 1 : -1);
          double dy = 0.2 * (Random().nextBool() ? 1 : -1);

          newBubble = BubbleData(top: top, left: left, dx: dx, dy: dy, logoPath: widget.logos[i % widget.logos.length]);

          for (var bubble in allBubbles) {
            double dx2 = bubble.left - newBubble.left;
            double dy2 = bubble.top - newBubble.top;
            double distance = sqrt(dx2 * dx2 + dy2 * dy2);
            if (distance <= bubbleRadius * 2) {
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
