import 'package:flutter/material.dart';

// const MaterialColor primaryColor = MaterialColor();

const MaterialColor primaryColorSwatch =
    MaterialColor(primaryColorValue, <int, Color>{
  50: Color(0xFFE8E0EE),
  100: Color(0xFFC5B3D4),
  200: Color(0xFF9F80B8),
  300: Color(0xFF794D9C),
  400: Color(0xFF5C2686),
  500: Color(primaryColorValue),
  600: Color(0xFF390069),
  700: Color(0xFF31005E),
  800: Color(0xFF290054),
  900: Color(0xFF1B0042),
});
const int primaryColorValue = 0xFF3F0071;

const MaterialColor accentColorSwatch =
    MaterialColor(accentColorValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(accentColorValue),
  400: Color(0xFFFFBDCA),
  700: Color(0xFFFFA3B6),
});
const int accentColorValue = 0xFFFB2576;
// const  accentColor = Color(0xFFFB2576);

final textColorPurple = primaryColorSwatch.shade200; //Color(0Xff9f7fb7);
const fieldColor = Colors.white;
const Color textGreyColor = Colors.grey; // Colors.grey.shade900;
final Color textGreyLightColor = Colors.grey[300]!; // Colors.grey.shade900;
const Color chatBg = Color(0xFFF0F0F0);
const Color cameraBg = Color(0xFFD9CCE3);// Colors.grey.shade900;
const Color textWhiteColor = Colors.white;
const Color textBlackColor = Colors.black;
const Color greenColor = Color(0xff5DF0BC);
const Color locationColor = Color(0xff124394);
