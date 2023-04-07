import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors_utils.dart';
import '../utils/textStyles.dart';
import 'custom_widgets.dart';

class MyTextField extends StatelessWidget {
  String? topLabel;
  VoidCallback? onTap;
  Color? color;

  // String hint;
  String label;
  Color? hintColor;
  double radius;
  double height;
  Color borderColor;
  Color? shadowColor;
  double borderWidth;
  TextEditingController? controller;
  double? width;
  Widget? suffixIcon;
  String? suffixText;
  int? maxLength;
  int maxLines;
  final keyboardType;
  TextAlign? textAlign;

  ///prefixIcon can be a widget or just icon data
  final dynamic prefixIcon;
  TextInputAction? textInputAction;
  void Function(String)? onSubmitted;
  FocusNode? focusNode;
  TextStyle? style;
  bool autoFocus;
  bool obscureText;
  ValueChanged<String>? onChanged;
  final validator;
  bool? enabled;

  MyTextField(
      {Key? key,
      this.topLabel,
      this.onTap,
      this.color,
      // this.hint = '',
      this.label = '',
      this.maxLines = 1,
      this.maxLength,
      this.radius = 15,
      this.width,
      this.height = 50,
      this.hintColor,
      this.borderColor = Colors.black,
      this.shadowColor,
      this.borderWidth = 1,
      this.controller,
      this.suffixText,
      this.suffixIcon,
      this.keyboardType,
      this.prefixIcon,
      this.textInputAction,
      this.onSubmitted,
      this.focusNode,
      this.style,
      this.autoFocus = false,
      this.obscureText = false,
      this.validator,
      this.enabled,
      this.textAlign,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(radius));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (topLabel != null)
          Text(
            topLabel!,
            style: med14.copyWith(color: textGreyColor),
          ),
        SizedBox(
          // padding: EdgeInsets.symmetric(horizontal: sizeW(10)),
          height: height,
          width: width != null ? sizeW(width!) : null,
          child: Center(
            child: TextFormField(
              // expands: true,
              onTap: onTap,
              enabled: enabled,
              controller: controller,
              maxLength: maxLength,
              maxLines: maxLines,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              onChanged: onChanged,
              focusNode: focusNode,
              style: style ?? const TextStyle(color: primaryColorSwatch),
              autofocus: autoFocus,
              obscureText: obscureText,
              validator: validator,
              textAlignVertical: TextAlignVertical.center,
              textAlign: textAlign ?? TextAlign.left,
              decoration: InputDecoration(
                // focusColor: hintColor,
                suffixText: suffixText,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                errorStyle: const TextStyle(height: 0.5),
                suffixIcon: suffixIcon,
                // labelText:
                //     label == '' ? null : (topLabel != null ? null : label.tr),
                // labelStyle: TextStyle(
                //   color: hintColor ?? textGreyColor,
                //   height: 0.5,
                // ),
                label: label == ''
                    ? null
                    : (topLabel != null
                        ? null
                        : Align(
                            alignment: Alignment.center,
                            child: Text(
                              label.tr,
                              style: TextStyle(
                                color: hintColor ?? textGreyColor,
                                height: 0.5,
                              ),
                            ),
                          )),
                //do not delete
                // label: Text(label.tr, style: const TextStyle(height: 2)),
                alignLabelWithHint: true,
                filled: true,
                fillColor: Colors.transparent,
                //Colors.white,
                border: border,
                focusedBorder: border,
                enabledBorder: border,
                prefixIcon: prefixIcon == null
                    ? null
                    : prefixIcon.runtimeType == IconData
                        ? Icon(
                            prefixIcon,
                            color: primaryColorSwatch,
                            size: sizeW(20),
                          )
                        : prefixIcon,
              ),
              onFieldSubmitted: onSubmitted,
            ),
          ),
        ),
      ],
    );
  }
}

class CountriesField extends StatefulWidget {
  final Widget child;
  final FocusNode focusNode;
  final List list;
  final TextEditingController textController;

  /* = FocusNode();*/

  const CountriesField(
      {super.key,
      required this.child,
      required this.focusNode,
      required this.list,
      required this.textController});

  @override
  CountriesFieldState createState() => CountriesFieldState();
}

class CountriesFieldState extends State<CountriesField> {
  // final FocusNode _focusNode = FocusNode();

  late OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context)!.insert(_overlayEntry);
      } else {
        _overlayEntry.remove();
      }
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
        builder: (context) => Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, size.height + 5.0),
                child: Material(
                  elevation: 4.0,
                  child: Container(
                    constraints: BoxConstraints(
                        maxHeight: sizeH(150), minHeight: sizeH(10)),
                    child: ListView.builder(
                      itemCount: widget.list.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(widget.list[index]),
                          onTap: () {
                            widget.textController.text = widget.list[index];
                            widget.focusNode.unfocus();
                            if (kDebugMode) {
                              print(widget.list[index]);
                            }
                          },
                        );
                      },
                    ),
                  ),
                  // child: ListView(
                  //   padding: EdgeInsets.zero,
                  //   shrinkWrap: true,
                  //   children: <Widget>[
                  //     ListTile(
                  //       title: const Text('Syria'),
                  //       onTap: () {
                  //         print('Syria Tapped');
                  //       },
                  //     ),
                  //     ListTile(
                  //       title: const Text('Lebanon'),
                  //       onTap: () {
                  //         print('Lebanon Tapped');
                  //       },
                  //     )
                  //   ],
                  // ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
        link: _layerLink,
        child: widget
            .child /* TextFormField(
        focusNode: _focusNode,
        decoration: const InputDecoration(labelText: 'Country'),
      ),*/
        );
  }
}
