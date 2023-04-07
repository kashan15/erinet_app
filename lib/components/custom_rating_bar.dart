import 'package:erinet_app/utils/colors_utils.dart';
import 'package:flutter/material.dart';

import 'custom_widgets.dart';

typedef RatingChangeCallback = void Function(double rating);

class CustomRatingBar extends StatefulWidget {
  final int starCount;
  final double rating;
  final double iconSize;
  final RatingChangeCallback? onRatingChanged;

  const CustomRatingBar(
      {super.key,
      this.starCount = 5,
      this.rating = 0.0,
      this.onRatingChanged,
      required this.iconSize});

  static getCustomRatingBar() {
    return CustomRatingBar(iconSize: sizeW(30), rating: 2.5);
  }

  @override
  State<CustomRatingBar> createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.starCount, (index) => buildStar(index)));
  }

  Widget buildStar(int index) {
    IconData icon;
    if (index >= widget.rating) {
      icon = Icons.star_border_rounded;
    } else if (index > widget.rating - 1 && index < widget.rating) {
      icon = Icons.star_half_rounded;
    } else {
      icon = Icons.star_rounded;
    }
    return InkResponse(
      onTap:
          widget.onRatingChanged == null ? null : () => widget.onRatingChanged!(index + 1.0),
      child: Icon(
        icon,
        size: widget.iconSize,
        color: primaryColorSwatch,
      ),
    );
  }
}
