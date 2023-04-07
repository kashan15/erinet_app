import 'package:flutter/material.dart';


class Dot extends StatelessWidget {
  final double? radius;
  final Color color;

  const Dot({Key? key, this.radius, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}




