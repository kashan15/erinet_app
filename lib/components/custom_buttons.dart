import 'dart:ffi';

import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

import '../utils/textStyles.dart';
import 'custom_widgets.dart';

class Button extends StatelessWidget {
  double? width;
  double height;
  String text;
  double? textHeight;
  TextStyle? textStyle;
  double radius;
  Color? color;
  double fontSize;
  FontWeight fontWeight;
  final VoidCallback? onPressed;
  Color? fontColor;
  double elevation;
  Color shadowColor;
  double? horizontalMargin;
  double? horizontalPadding;
  double? verticalPadding;
  Alignment? alignment;

  Button(
      {Key? key,
      this.height = 50,
      this.width,
      this.elevation = 0,
      this.onPressed,
      this.horizontalMargin,
      this.shadowColor = Colors.transparent,
      required this.text,
      this.textHeight,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w500,
      this.fontColor,
      this.textStyle,
      this.radius = 7,
      this.color,
      this.horizontalPadding,
      this.verticalPadding,
      this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: sizeW(horizontalMargin ?? 0)),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: shadowColor, blurRadius: 10, offset: Offset(0, elevation))
      ], borderRadius: BorderRadius.circular(sizeW(radius))),
      child: ElevatedButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.white.withAlpha(40)),
            backgroundColor:
                MaterialStateProperty.all(color ?? accentColorSwatch),
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                horizontal: horizontalPadding ?? 0,
                vertical: verticalPadding ?? 0)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(sizeW(radius)),
              ),
            )),
        onPressed: onPressed,
        child: Center(
          child: Text(
            text.tr,
            textAlign: TextAlign.center,
            style: textStyle ??
                med14.copyWith(
                    color: fontColor ?? Colors.white,
                    height: textHeight ?? 2.5),
          ),
        ),
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  Widget? prefixIcon;
  Widget? suffixIcon;
  double? width;
  double? height;
  String text;
  double radius;
  VoidCallback onPressed;
  Color fontColor;
  double elevation;
  Color shadowColor;
  double? horizontalMargin;
  double? horizontalPadding;
  double? verticalPadding;
  MainAxisAlignment mainAxisAlignment;

  MyIconButton(
      {Key? key,
      this.height,
      this.prefixIcon,
      this.suffixIcon,
      this.width,
      this.elevation = 0,
      required this.onPressed,
      this.shadowColor = Colors.transparent,
      required this.text,
      this.fontColor = Colors.white,
      this.radius = 40,
      this.horizontalMargin,
      this.horizontalPadding,
      this.verticalPadding,
      this.mainAxisAlignment = MainAxisAlignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: sizeW(horizontalMargin ?? 0)),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: shadowColor, blurRadius: 10, offset: Offset(0, elevation))
      ], borderRadius: BorderRadius.circular(sizeW(radius))),
      child: ElevatedButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.white.withAlpha(40)),
            backgroundColor: MaterialStateProperty.all(primaryColorSwatch),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(sizeW(radius)),
            ))),
        onPressed: onPressed,
        child: Center(
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              prefixIcon != null
                  ? Row(children: [prefixIcon!, SizedBox(width: sizeW(10))])
                  : const SizedBox(),
              SizedBox(
                width: width != null ? (width! / 100) * 60 : null,
                child: Center(
                  child: Text(
                    text,
                    style: med14.copyWith(color: fontColor, fontSize: 12.sp),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
              suffixIcon != null
                  ? Row(children: [SizedBox(width: sizeW(10)), suffixIcon!])
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
