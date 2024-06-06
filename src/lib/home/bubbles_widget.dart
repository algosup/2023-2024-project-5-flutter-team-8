import 'dart:math';
import 'package:flutter/material.dart';

class BubblePainter extends CustomPainter {
  final Color bubbleColor;
  final double bubbleRadius;

  BubblePainter({required this.bubbleColor, required this.bubbleRadius});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = bubbleColor;
    canvas.drawCircle(Offset(bubbleRadius, bubbleRadius), bubbleRadius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
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

class BubbleData {
  double top;
  double left;
  double dx;
  double dy;

  BubbleData({required this.top, required this.left, required this.dx, required this.dy});
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

              // Reverse direction on collision and add slight randomness to avoid repetitive collisions
              widget.bubbleData.dx = -widget.bubbleData.dx + (Random().nextDouble() - 0.5) * 0.1;
              widget.bubbleData.dy = -widget.bubbleData.dy + (Random().nextDouble() - 0.5) * 0.1;
              bubble.dx = -bubble.dx + (Random().nextDouble() - 0.5) * 0.1;
              bubble.dy = -bubble.dy + (Random().nextDouble() - 0.5) * 0.1;
            }
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.bubbleData.top,
      left: widget.bubbleData.left,
      child: CustomPaint(
        painter: BubblePainter(bubbleColor: Colors.red.withOpacity(0.5), bubbleRadius: bubbleRadius),
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

  BubblesWidget({required this.bubbleCount});

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

          newBubble = BubbleData(top: top, left: left, dx: dx, dy: dy);

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
