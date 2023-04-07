
import 'package:flutter/material.dart';

class FlexibleTextField extends StatelessWidget {


  String label;
  String? Function(String?)? validator;
  TextEditingController? textController;
  TextInputType? keyboardType;
  bool enable = true;
  double width;
  double height;
  int? maxLines;
  String? suffixText;
  TextInputAction? textInputAction;



  FlexibleTextField(
      {
        super.key,
        required this.label,
        this.validator,
        this.textController,
        this.keyboardType,
        this.enable = true,
        required this.height,
        required this.width,
        this.maxLines,
        this.textInputAction,
        this.suffixText,

      });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: SizedBox(
        height: height,
        width: width,
        child: TextFormField(

            keyboardType: keyboardType,
            validator: validator,
            controller: textController,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.left,
            cursorColor: Colors.black,
            maxLines: maxLines,

            style: const TextStyle(
                color: Colors.black, fontStyle: FontStyle.normal),
            decoration: InputDecoration(
              suffixText: suffixText,
              // errorStyle: TextStyle(height: 0),
              hintText: "$label : ",
              // hintStyle: TextStyle(),
              contentPadding: const EdgeInsets.only(
                left:10,
                right:10,
                top: 10, /*top: -5.0,*/
              ),
              //filled: true,
              //  fillColor: enable ? customWhiteColor  : customGreyAccentColor,
              border: OutlineInputBorder(
                borderSide:BorderSide(color: Colors.black),
              ),
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: customPrimaryColor),
              // ),
              // focusedBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(color: customPrimaryColor),
              // ),
            ),
            textInputAction:textInputAction),
      ),
    );
  }
}
