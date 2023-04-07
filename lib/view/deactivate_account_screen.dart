import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_bottom_tab_bar.dart';
import '../components/custom_buttons.dart';
import '../components/custom_widgets.dart';
import '../components/new_custom_dialog.dart';
import '../components/text_field.dart';
import '../utils/input_validations.dart';
import '../utils/string_utils.dart';

class DeactivateAccountScreen extends StatelessWidget {
  const DeactivateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: const CustomBottomTabBar(),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: sizeW(30), vertical: sizeH(30)),
        child: Column(
          children: [
            heading(deactivateAccountSUtil.split(' ')[0],
                deactivateAccountSUtil.split(' ')[1]),

            height(35),

            //form
            _form(),
            height(50),

            //button save
            Button(text: saveSUtil,
              onPressed: () =>  Get.dialog(
                CustomDialogOne(
                  icon: Icons.check_circle,
                  primaryLabel: "Yes",
                  secondaryLabel: "Next",
                  primaryTap: (){
                    Navigator.pop(Get.context!);
                  },
                  secondaryTap: ()=> Navigator.pop(Get.context!),
                  title: "Account have been deleted\n\tSuccessfully",

                ),

              ).then((value) => Get.back()),
            ),

          ],
        ),
      ),
    );
  }

  Widget _form() {
    return Column(
      children: [
        //full name
        MyTextField(
          validator: InputValidations.commonValidation,
          label: userIDSUtil, 
          textInputAction: TextInputAction.next,
          // keyboardType: TextInputType.name,
          topLabel: userIDSUtil,
        ),
        height(15),

        //email address
        MyTextField(
          validator: InputValidations.commonValidation,
          label: enterReasonSUtil,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          topLabel: enterReasonSUtil,
        ),
        height(15),
      ],
    );
  }
}
