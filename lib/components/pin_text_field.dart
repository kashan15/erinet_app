import '../components/custom_widgets.dart';
import '../utils/colors_utils.dart';
import '../utils/textStyles.dart';
import 'package:flutter/material.dart';

class PinTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final FocusNode focusNode;
  final bool hasFocus;

  const PinTextField(this.controller, this.autoFocus,
      {Key? key, required this.focusNode, required this.hasFocus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.0),
          boxShadow: hasFocus
              ? [
                  BoxShadow(
                    color: Colors.black.withAlpha(60),
                    offset: const Offset(
                      0.0,
                      3.0,
                    ),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                  ),
                  // BoxShadow(color: Colors.grey, blurRadius: 5.0, spreadRadius: 5)
                ]
              : null),
      child: SizedBox.square(
        dimension: sizeW(60),
        child: TextField(
          focusNode: focusNode,
          autofocus: autoFocus,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: controller,
          maxLength: 1,
          cursorColor: Theme.of(context).primaryColor,
          style: med18.copyWith(color: primaryColorSwatch),
          decoration: InputDecoration(
            filled: true,
            fillColor: primaryColorSwatch.shade100,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(7.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(7.0),
            ),
            counterText: '',
            hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0),
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty) {
              FocusScope.of(context).previousFocus();
            }
          },
        ),
      ),
    );
  }
}
