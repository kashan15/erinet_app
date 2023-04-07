import 'package:erinet_app/components/custom_popup_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_buttons.dart';
import '../components/custom_widgets.dart';
import '../utils/assets_utils.dart';
import '../utils/colors_utils.dart';
import '../utils/textStyles.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorSwatch,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(Assets.welcome))),
          child: Stack(
            children: [
              Positioned(
                  top: Get.height * 0.4,
                  left: Get.height * 0.04,
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Erinet',
                            style: bold.copyWith(
                                fontSize: sizeFS(50),
                                fontWeight: FontWeight.bold,
                                height: 1,
                                color: Colors.white)),
                        height(10),
                        SizedBox(
                          width: sizeW(350),
                          child: Text('Hassle-Free International Calls All Around The World',
                              maxLines: 3 ,
                              overflow: TextOverflow.ellipsis,
                              style: med28.copyWith(
                                height: 1,
                                color: Colors.white,
                              )),
                        ),
                        height(10),
                        Text('We Provide Best Quality\nCalling Services.',
                            overflow: TextOverflow.clip,
                            style: reg18.copyWith(
                                height: 1.2, color: textColorPurple)),
                        height(25),
                        Text('Join Now',
                            overflow: TextOverflow.clip,
                            style: reg18.copyWith(
                                height: 1.2, color: textColorPurple)),
                      ],
                    ),
                  )),
              Positioned(
                  bottom: Get.height * 0.1,
                  left:( Get.width - sizeW(280)) /2,// * 0.05,
                  child: Button(
                    width: sizeW(280),
                    text: "Get Started",
                    // onPressed: ()=> Get.offAndToNamed(kOnBoardingScreen),
                    onPressed: ()=>
                        showDialog(
                            context: context,
                            builder: (_) => const LocationPopup()
                        )
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
