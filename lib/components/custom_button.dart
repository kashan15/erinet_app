import 'package:erinet_app/utils/colors_utils.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.label,
    this.onTap,
    this.textColor,
    this.bgColor,
    required this.isSelected,
    this.fontSize
  }) : super(key: key);

  String label;
  Function()? onTap;
  Color? bgColor;
  Color? textColor;
  bool isSelected = true;
  double? fontSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite, //width * 100,
        decoration: BoxDecoration(
          color: isSelected ? accentColorSwatch : bgColor ?? accentColorSwatch,
          border: Border.all(
              color:
              isSelected ? (bgColor ?? accentColorSwatch) : accentColorSwatch),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Center(
            child: Text(
              label,
              style: TextStyle(
                  color:
                  (isSelected ? (bgColor ?? Colors.white) : Colors.white),
                  fontWeight: FontWeight.bold,
                  fontSize:fontSize??12.0
              ),
            )),
      ),
    );
  }
}


/*

Widget CustomButton({
  required String label,
  required Function() onTap,
  Color? bgColor,
  required bool isSelected,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: double.maxFinite,
      width: double.maxFinite, //width * 100,
      decoration: BoxDecoration(
        color: isSelected ? customWhiteColor : bgColor ?? customPrimaryColor,
        border: Border.all(
            color:
                isSelected ? bgColor ?? customPrimaryColor : customWhiteColor),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Center(
          child: Text(
        label,
        style: TextStyle(
          color:
              isSelected ? bgColor ?? customPrimaryColor : customWhiteTextColor,
          fontWeight: FontWeight.bold,
        ),
      )),
    ),
  );
}
*/
