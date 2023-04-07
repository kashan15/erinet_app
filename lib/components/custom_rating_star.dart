import '../utils/colors_utils.dart';
import 'package:flutter/material.dart';

class CustomStarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final double iconSize;
  final Color? iconColor;

  const CustomStarRating(
      {super.key,
      this.starCount = 5,
      this.rating = 0.0,
      this.iconColor = primaryColorSwatch,

      required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(starCount, (index) => buildStar(index)));
  }

  Widget buildStar(int index) {
    IconData icon;
    if (index >= rating) {
      icon = Icons.star_border_rounded;
    } else if (index > rating - 1 && index < rating) {
      icon = Icons.star_half_rounded;
    } else {
      icon = Icons.star_rounded;
    }
    return Icon(
      icon,
      size: iconSize,
      color: iconColor,
    );
  }
}
