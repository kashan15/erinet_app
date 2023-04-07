import '../utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/string_utils.dart';
import '../utils/textStyles.dart';
import 'custom_buttons.dart';
import 'custom_widgets.dart';

class CustomOverlayX extends StatefulWidget {
  String primaryLabel;
  VoidCallback primaryTap;
  String? secondaryLabel;
  VoidCallback? secondaryTap;
  IconData? icon;
  Widget? asset;
  String title;
  String label;

  CustomOverlayX(
      {this.icon,
      this.asset,
      required this.title,
      required this.label,
      required this.primaryLabel,
      this.secondaryLabel,
      required this.primaryTap,
      this.secondaryTap,
      super.key});

  @override
  State<CustomOverlayX> createState() => _CustomOverlayXState();
}

class _CustomOverlayXState extends State<CustomOverlayX>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeInOut
        // fastLinearToSlowEaseIn
        );
    controller.addListener(() => {setState(() {})});
    controller.forward();
    super.initState();
  }

  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
            color: Colors.transparent,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: MyBox(
                margin: 20,
                padding: 20,
                color: textWhiteColor,
                radius: 10,
                child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Center(
                        child: widget.icon != null
                            ? Icon(widget.icon,
                                color: primaryColorSwatch, size: sizeW(60))
                            : widget.asset,
                      ),
                      MyBox(
                          padding: 10,
                          child: Column(
                            children: [
                              Text(widget.title.tr,
                                  textAlign: TextAlign.center, style: med18),
                              height(10),
                              Text(widget.label.tr,
                                  textAlign: TextAlign.center,
                                  style: med14.copyWith(color: textBlackColor)),
                              height(30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Button(
                                      text: widget.primaryLabel.tr,
                                      height: 40,
                                      onPressed: widget.primaryTap,
                                    ),
                                  ),
                                  width(20),
                                  Expanded(
                                    child: Button(
                                      text: widget.secondaryLabel?.tr ??
                                          noSUtil.tr,
                                      height: 40,
                                      onPressed: widget.secondaryTap ??
                                          () => Get.back(),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ]),
              ),
            )));
  }
}

class AlertOverlay extends StatefulWidget {
  String? title;
  String? label;
  IconData? icon;
  Widget? asset;
  String? primaryLabel;
  VoidCallback? primaryTap;

  AlertOverlay(
      {this.title,
      this.label,
      this.icon,
      this.asset,
      this.primaryLabel,
      this.primaryTap,
      super.key});

  @override
  State<AlertOverlay> createState() => _AlertOverlayState();
}

class _AlertOverlayState extends State<AlertOverlay>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeInOut
        // fastLinearToSlowEaseIn
        );
    controller.addListener(() => {setState(() {})});
    controller.forward();
    super.initState();
  }

  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
            color: Colors.transparent,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: MyBox(
                margin: 80,
                padding: 20,
                color: Colors.white,
                radius: 10,
                child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Center(
                        child: widget.icon != null
                            ? MyBox(
                                height: sizeW(40),
                                width: sizeW(40),
                                radius: 7,
                                color: primaryColorSwatch.shade100,
                                child: Icon(widget.icon,
                                    color: primaryColorSwatch),
                              )
                            : widget.asset,
                      ),
                      MyBox(
                          padding: 10,
                          child: Column(
                            children: [
                              widget.title == null
                                  ? const SizedBox()
                                  : Text(widget.title!.tr,
                                      textAlign: TextAlign.center,
                                      style: med18),
                              height(10),
                              widget.label != null
                                  ? Text(widget.label!.tr,
                                      textAlign: TextAlign.center,
                                      style:
                                          med12.copyWith(color: textBlackColor))
                                  : const SizedBox(),
                              height(30),
                              Button(
                                text: widget.primaryLabel?.tr ?? okSUtil.tr,
                                height: 40,
                                onPressed:
                                    widget.primaryTap ?? () => Get.back(),
                              )
                            ],
                          )),
                    ]),
              ),
            )));
  }
}

class CustomDialog extends StatefulWidget {
  String primaryLabel;
  VoidCallback primaryTap;
  String? secondaryLabel;
  Function()? secondaryTap;
  IconData? icon;
  Widget? asset;
  String title;
  String label;
  Widget? child;

  CustomDialog(
      {this.icon,
      this.asset,
      required this.title,
      required this.label,
      required this.primaryLabel,
      this.secondaryLabel,
      required this.primaryTap,
      this.secondaryTap,
      this.child,
      super.key});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeInOut
        // fastLinearToSlowEaseIn
        );
    controller.addListener(() => {setState(() {})});
    controller.forward();
    super.initState();
  }

  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
            color: Colors.transparent,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: MyBox(
                margin: 20,
                padding: 20,
                color: textWhiteColor,
                radius: 10,
                child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Center(
                        child: widget.icon != null
                            ? Icon(widget.icon,
                                color: primaryColorSwatch, size: sizeW(60))
                            : widget.asset,
                      ),
                      MyBox(
                          padding: 10,
                          child: Column(
                            children: [
                              Text(widget.title.tr,
                                  textAlign: TextAlign.center, style: med18),
                              height(10),
                              Text(widget.label.tr,
                                  textAlign: TextAlign.center,
                                  style: med14.copyWith(color: textBlackColor)),
                              widget.child ?? const SizedBox(),
                              height(30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Button(
                                      text: widget.primaryLabel.tr,
                                      height: 40,
                                      onPressed: widget.primaryTap,
                                    ),
                                  ),
                                  width(20),
                                  Expanded(
                                    child: Button(
                                      text: widget.secondaryLabel!.tr,
                                      height: 40,
                                      onPressed: widget.secondaryTap,
                                    ),
                                  ),

                                  /// Previous Secondary Tap
                                  // Expanded(
                                  //   child: Button(
                                  //     text: widget.secondaryLabel?.tr ??
                                  //         noSUtil.tr,
                                  //     height: 40,
                                  //     onPressed: ()=>
                                  //     widget.secondaryTap ??
                                  //         () => Get.back(closeOverlays: true),
                                  //   ),
                                  // ),
                                ],
                              )
                            ],
                          )),
                    ]),
              ),
            )));
  }
}


class CustomDialogOne extends StatefulWidget {
  String primaryLabel;
  VoidCallback primaryTap;
  String? secondaryLabel;
  Function()? secondaryTap;
  IconData? icon;
  Widget? asset;
  String title;
  Widget? child;

  CustomDialogOne(
      {this.icon,
        this.asset,
        required this.title,

        required this.primaryLabel,
        this.secondaryLabel,
        required this.primaryTap,
        this.secondaryTap,
        this.child,
        super.key});

  @override
  State<CustomDialogOne> createState() => _CustomDialogOneState();
}

class _CustomDialogOneState extends State<CustomDialogOne>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeInOut
      // fastLinearToSlowEaseIn
    );
    controller.addListener(() => {setState(() {})});
    controller.forward();
    super.initState();
  }

  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
            color: Colors.transparent,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: MyBox(
                margin: 20,
                padding: 20,
                color: textWhiteColor,
                radius: 10,
                child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Center(
                        child: widget.icon != null
                            ? Icon(widget.icon,
                            color: primaryColorSwatch, size: sizeW(60))
                            : widget.asset,
                      ),
                      MyBox(
                          padding: 10,
                          child: Column(
                            children: [
                              Text(widget.title.tr,
                                  textAlign: TextAlign.center, style: med18),

                              height(30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Button(
                                      text: widget.secondaryLabel!.tr,
                                      height: 40,
                                      onPressed: widget.secondaryTap,
                                    ),
                                  ),

                                  /// Previous Secondary Tap
                                  // Expanded(
                                  //   child: Button(
                                  //     text: widget.secondaryLabel?.tr ??
                                  //         noSUtil.tr,
                                  //     height: 40,
                                  //     onPressed: ()=>
                                  //     widget.secondaryTap ??
                                  //         () => Get.back(closeOverlays: true),
                                  //   ),
                                  // ),
                                ],
                              )
                            ],
                          )),
                    ]),
              ),
            )));
  }
}
