import '../utils/colors_utils.dart';
import '../utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_buttons.dart';
import '../components/custom_widgets.dart';
import '../utils/assets_utils.dart';
import '../utils/textStyles.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  int selectedIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorSwatch,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                itemCount: pages.length,
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                itemBuilder: (context, position) {
                  return OnboardBody(
                    index: position,
                    text1: pages[position].text1,
                    text2: pages[position].text2,
                    image: pages[position].image,
                    image2: pages[position].image2,
                  );
                }),
            Positioned(
              bottom: sizeH(70),
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sizeW(20)),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            pages.length,
                            (index) => Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: DotIndicator(
                                    isActive: index == selectedIndex))),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);

   final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: /*isActive ? 7: */ sizeH(8),
      width: isActive ? sizeW(30) : sizeW(10),
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.grey,
          borderRadius: BorderRadius.circular(12)),
    );
  }
}

class OnBoard {
  final String text1, text2, image, image2;

  OnBoard(this.text1, this.text2, this.image, this.image2);
}

final List<OnBoard> pages = [
  OnBoard(
      'Connect\nwith Erinet',
      'Connects you with your loved ones no matter you are in the world',
      Assets.onboard1,
      Assets.call),
  OnBoard(
      "Connecting\nYou With\nExcellence",
      "Our dedicated call agents are here to listen, understand and exceed your expectations with\na smile",
      Assets.onboard2,
      Assets.headphone),
];

class OnboardBody extends StatefulWidget {
  const OnboardBody(
      {Key? key,
      required this.index,
      required this.text1,
      required this.text2,
      required this.image,
      required this.image2})
      : super(key: key);

  final int index;
  final String text1;
  final String text2;

  final String image;
  final String image2;

  @override
  State<OnboardBody> createState() => _OnboardBodyState();
}

class _OnboardBodyState extends State<OnboardBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: Get.height * 0.08,
            right: Get.width * 0.05,
            child: widget.index == 1
                ? Button(
                    width: sizeW(70),
                    height: sizeH(35),
                    text: "Next",
                    textHeight: 1.5,
                    onPressed:
                        () => Get.toNamed(kLoginScreen)

                  )
                : const SizedBox()),
        Positioned(
          top: Get.height * 0.1,
          left: Get.width * 0.15,
          child: Image(image: AssetImage(widget.image2), fit: BoxFit.cover),
        ),
        Positioned(
          top: Get.height * 0.2,
          right: sizeW(-5),
          child: Image(image: AssetImage(widget.image), fit: BoxFit.cover),
        ),
        Positioned(
          bottom: Get.height * 0.1,
          left: Get.width * 0.05,
          child: SizedBox(
            width: Get.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text1,
                  style: bold.copyWith(
                      fontSize: sizeFS(32), height: 1, color: Colors.white),
                ),
                height(10),
                Text(
                  widget.text2,
                  style: med14.copyWith(height: 1, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}
