import 'dart:math';

import 'package:flutter/material.dart';

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 10, dashSpace = 10, startY = 0;
    final paint = Paint()
      ..color = Colors.black54
      ..strokeWidth = size.width;
    // while (startY < size.height) {
      // print("ASADASASASASAS");
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      // canvas.drawLine(Offset(0,dashHeight + dashSpace), Offset(0, dashHeight + dashSpace + dashHeight), paint);
      // startY += dashHeight + dashSpace;
    // }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: 100,
    ));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CallConnectIcon extends StatefulWidget {
  final double size;
  final Color color;
  final bool connected;

  CallConnectIcon({this.size = 100.0, this.color = Colors.red, this.connected = true});

  @override
  _CallConnectIconState createState() => _CallConnectIconState();
}

class _CallConnectIconState extends State<CallConnectIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    if (widget.connected) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(CallConnectIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.connected != widget.connected) {
      if (widget.connected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _CallConnectIconPainter(widget.color, _controller.value),
          );
        },
      ),
    );
  }
}

class _CallConnectIconPainter extends CustomPainter {
  final Color color;
  final double value;

  _CallConnectIconPainter(this.color, this.value);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    double radius = size.width / 2.0;
    double arcAngle = value * 2.0 * 3.14;
    double startX = radius + radius * cos(arcAngle / 2.0);
    double startY = radius + radius * sin(arcAngle / 2.0);
    double endX = radius + radius * cos(arcAngle / 2.0 + 3.14);
    double endY = radius + radius * sin(arcAngle / 2.0 + 3.14);

    Path path = Path()
      ..moveTo(startX, startY)
      ..arcTo(Rect.fromCircle(center: Offset(radius, radius), radius: radius), arcAngle / 2.0, 3.14, false)
      ..moveTo(endX, endY)
      ..lineTo(radius + radius * cos(3.14 / 4.0), radius + radius * sin(3.14 / 4.0))
      ..moveTo(endX, endY)
      ..lineTo(radius + radius * cos(7.0 * 3.14 / 4.0), radius + radius * sin(7.0 * 3.14 / 4.0));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CallConnectIconPainter oldDelegate) => oldDelegate.value != value;
}




class CallWaitingAnimation extends StatefulWidget {
  @override
  _CallWaitingAnimationState createState() => _CallWaitingAnimationState();
}

class _CallWaitingAnimationState extends State<CallWaitingAnimation>
    with SingleTickerProviderStateMixin {
  late
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      child: Icon(
        Icons.call,
        size: 50.0,
        color: Colors.green,
      ),
    );
  }
}


class CallWaitingAnimationNew extends StatefulWidget {
  @override
  _CallWaitingAnimationStateNew createState() => _CallWaitingAnimationStateNew();
}

class _CallWaitingAnimationStateNew extends State<CallWaitingAnimationNew>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double size = 50.0;
    final Color color = Colors.green;

    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_,__) {
          return Transform.rotate(
            angle: _animation.value * 2.0 * 3.141592653589793,
            child: Icon(
              Icons.call,
              size: 50.0,
              color: Colors.green,
            ),/*Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: color.withOpacity(0.5),
                  width: 3.0,
                ),
              ),
              child: Center(
                child: Container(
                  width: size * 0.6,
                  height: size * 0.6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                ),
              ),
            ),*/
          );
        },

      ),
    );
  }
}