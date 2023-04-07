import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../utils/assets_utils.dart';
import '../utils/colors_utils.dart';
import '../utils/textStyles.dart';
import 'custom_buttons.dart';
import 'custom_rating_star.dart';

String getDate(dateTime) {
  return DateFormat('MMM dd, yyyy').format(dateTime);
}

String getTime(dateTime) {
  return DateFormat('h:mm a').format(dateTime);
}

String getDateTime(dateTime) {
  return DateFormat('MMM dd, yyyy h:mm a').format(dateTime);
}

double sizeW(double size) {
  double res = Get.width / (Get.width / size);
  return res;
}

double sizeH(double size) {
  double res = Get.height / (Get.height / size);
  return res;
}

double widthFS(double size) {
  double res = size.w;
  return res;
}

double sizeFS(double size) {
  double res = size.sp;
  return res;
}

double heightFS(double size) {
  double res = size.h;
  return res;
}

Widget height(double size) {
  return SizedBox(height: sizeH(size));
}

Widget width(double size) {
  return SizedBox(width: sizeW(size));
}

Widget divider({Color color = Colors.grey, double height = 1}) {
  return Divider(color: color, height: height);
}

Widget heading(String text, String subTitle) {
  return Align(
    alignment: Alignment.topLeft,
    child: RichText(
      text: TextSpan(
          text: "${text.tr}\n",
          style: bold28.copyWith(
            color: primaryColorSwatch,
            height: 0.9,
          ),
          children: [
            TextSpan(
              text: subTitle.tr,
              style: bold28.copyWith(color: primaryColorSwatch.shade200),
            )
          ]),
    ),
  );
}

Widget tab(String text) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: sizeW(10)),
    child: Text(
      text,
      style: reg12,
    ),
  );
}

Future showLoadingDialog(context) {
  return showDialog(
      context: context,
      builder: (_) =>
      const Material(
        color: Colors.transparent,
        child: Center(child: CircularProgressIndicator()),
      ));
}

Widget circleAvatar({
  // required var asset,
  var asset,
  required double size,
  Widget? imageWidget,
  bool shadow = true,
  Alignment? alignment,
  Color? bgColor,
  Color? iconColor,
  Color? borderColor,
  bool border = false,
  BoxFit? boxFit,
}) {
  return Align(
    alignment: alignment ?? Alignment.center,
    child: Container(
        width: size,
        //sizeH(width),
        height: size,
        //sizeH(height),
        decoration: BoxDecoration(
            color: bgColor ?? Colors.black, //fieldColor,
            shape: BoxShape.circle,
            border: border
                ? Border.all(
                color: borderColor ?? primaryColorSwatch,
                width: 2,
                strokeAlign: StrokeAlign.outside)
                : null,
            boxShadow: shadow
                ? [
              const BoxShadow(
                color: textGreyColor,
                offset: Offset(
                  0.0,
                  3.0,
                ),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ),
            ]
                : null),
        clipBehavior: Clip.hardEdge,
        child: imageWidget ??
        genericAsset(asset: asset, iconColor: iconColor, boxFit:boxFit)

      // asset.runtimeType != IconData
      //     ? Image(
      //         image: AssetImage(asset),
      //         fit: BoxFit.fill,
      //       )
      //     : Icon(asset,color:iconColor),
    ),
  );
}

Widget rating(double rating,
    totalRatings,) {
  return Row(
    children: [
      CustomStarRating(
        rating: rating,
        iconSize: 10,
        iconColor: Colors.orange,
      ),
      Text(rating.toString(), style: med8.copyWith(color: textWhiteColor)),
      Text("(${totalRatings.toString()})",
          style: med8.copyWith(color: textGreyColor)),
    ],
  );
}

class MyBox extends StatelessWidget {
  final double? height;
  final double? maxHeight;
  final double? minHeight;
  final double? maxWidth;
  final double? minWidth;
  final double? width;
  final double padding;
  final Widget? child;

  /// if you're declaring border you must declare *borderRadius*
  final double? radius;

  /// if you're declaring border you must declare *borderRadius*
  final BorderRadius? borderRadius;
  final double borderWidth;
  final Color borderColor;
  final Color color;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  final Color shadowColor;
  final double? horizontalMargin;
  final double? verticalMargin;
  final double margin;
  final DecorationImage? decImage;
  final Alignment? alignment;
  final List<Color>? gradientColors;
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final BoxShadow? boxShadow;

  /// if you're declaring border you must declare *borderRadius*
  final Border? border;

  const MyBox({Key? key,
    this.width,
    this.height,
    this.padding = 0,
    this.child,
    this.radius,
    this.borderWidth = 0,
    this.shadowColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.borderRadius,
    this.border,
    this.color = Colors.transparent,
    this.horizontalPadding,
    this.topRight = 0,
    this.topLeft = 0,
    this.bottomRight = 0,
    this.bottomLeft = 0,
    this.horizontalMargin,
    this.verticalPadding,
    this.verticalMargin,
    this.margin = 0,
    this.decImage,
    this.gradientColors,
    this.alignment,
    this.end,
    this.begin,
    this.boxShadow,
    this.maxWidth,
    this.minWidth,
    this.maxHeight,
    this.minHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: width,
      height: height,
      constraints: /* maxHeight != null && minHeight != null*/
      /*?*/ BoxConstraints(
        minHeight: minHeight ?? 0.0,
        maxHeight: maxHeight ?? double.infinity,
        maxWidth: maxWidth ?? double.infinity,
        minWidth: minWidth ?? 0.0,
      ),
      // : null,
      padding: horizontalPadding != null || verticalPadding != null
          ? EdgeInsets.symmetric(
          horizontal:
          horizontalPadding != null ? sizeW(horizontalPadding!) : 0,
          vertical: verticalPadding != null ? sizeW(verticalPadding!) : 0)
          : EdgeInsets.all(sizeW(padding)),
      margin: horizontalMargin != null || verticalMargin != null
          ? EdgeInsets.symmetric(
          horizontal:
          horizontalMargin != null ? sizeW(horizontalMargin!) : 0,
          vertical: verticalMargin != null ? sizeW(verticalMargin!) : 0)
          : EdgeInsets.all(sizeW(margin)),
      decoration: BoxDecoration(
          color: gradientColors == null ? color : null,
          border: border ?? Border.all(color: borderColor, width: borderWidth),
          gradient: gradientColors == null
              ? null
              : begin != null && end != null
              ? LinearGradient(
              begin: begin!, end: end!, colors: gradientColors!)
              : LinearGradient(colors: gradientColors!),
          borderRadius: border != null
              ? borderRadius
              : (radius != null
              ? BorderRadius.circular(sizeW(radius!))
              : BorderRadius.only(
            topLeft: Radius.circular(sizeW(topLeft)),
            topRight: Radius.circular(sizeW(topRight)),
            bottomLeft: Radius.circular(sizeW(bottomLeft)),
            bottomRight: Radius.circular(sizeW(bottomRight)),
          )),
          image: decImage,
          boxShadow: [
            boxShadow ??
                BoxShadow(
                    color: shadowColor,
                    blurRadius: 3,
                    offset: const Offset(0, 2))
          ]),
      child: child,
    );
  }
}

Widget loader() {
  return SizedBox(
    height: Get.height,
    width: Get.width,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0),
      child: Container(
        color: Colors.black.withOpacity(0.1),
        child: const Center(child: CircularProgressIndicator()),
      ),
    ),
  );
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child,
      ScrollableDetails details) {
    return child;
  }
}

Widget agentBox({required String name,
  String id = '',
  required double totalRating,
  required int ratingCount,
  required String primaryLabel,
  String? secondaryLabel,
  VoidCallback? secondaryOnTap,
  VoidCallback? primaryOnTap}) {
  return MyBox(
      width: Get.width,
      height: sizeH(120),
      color: primaryColorSwatch,
      radius: 10,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sizeW(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
                alignment: Alignment.topCenter,
                child:
                circleAvatar(asset: Assets.men, size: 80, shadow: false)),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sizeW(10)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            style: med12.copyWith(color: textWhiteColor)),
                        id != ''
                            ? Text("ID: $id",
                            style: med12.copyWith(
                                color: textWhiteColor, height: 1))
                            : const SizedBox(),
                        rating(totalRating, ratingCount),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Button(
                      height: sizeH(32),
                      width: sizeW(80),
                      text: primaryLabel,
                      textHeight: 1.7,
                      onPressed: primaryOnTap),
                ),
                height(10),
                secondaryLabel != null
                    ? Align(
                  alignment: Alignment.centerRight,
                  child: Button(
                    height: sizeH(32),
                    width: sizeW(80),
                    text: secondaryLabel,
                    textHeight: 1.7,
                    onPressed: secondaryOnTap,
                    color: textGreyColor,
                  ),
                )
                    : const SizedBox(),
              ],
            )
          ],
        ),
      ));
}
