import 'package:erinet_app/components/new_custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_bottom_tab_bar.dart';
import '../components/custom_buttons.dart';
import '../components/custom_widgets.dart';
import '../components/text_field.dart';
import '../utils/colors_utils.dart';
import '../utils/input_validations.dart';
import '../utils/route_utils.dart';
import '../utils/string_utils.dart';
import '../utils/textStyles.dart';

class BankTransferScreen extends StatelessWidget {
  const BankTransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: const CustomBottomTabBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: sizeW(30),
          ),
          child: Column(
            children: [
              _header(),
              height(10),
              _form(),
              Button(
                text: nextSUtil,
                onPressed: () =>  Get.dialog(
                  CustomDialogOne(
                    icon: Icons.check_circle,
                    primaryLabel: "Yes",
                    secondaryLabel: "Next",
                    primaryTap: (){
                      Get.toNamed(kLoginScreen);
                    },
                    secondaryTap: ()=> Get.toNamed(kBankTransferProofScreen),
                    title: "Congratulations! You have successfully recharged \$40 from airtel. Enjoy your seamless communication experience.",
                    
                  ),

                ).then((value) => Get.back()),

                    //Get.toNamed(kBankTransferProofScreen),
              ),
            ],
          ),
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
          label: accountHolderNameSUtil,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          topLabel: accountHolderNameSUtil,
        ),
        height(15),

        //email address
        MyTextField(
          validator: InputValidations.emailValidation,
          label: accountNoSUtil,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          topLabel: accountNoSUtil,
        ),
        height(15),

        //mobile number
        MyTextField(
          validator: InputValidations.commonValidation,
          label: ibanNoSUtil,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          topLabel: ibanNoSUtil,
        ),
        height(15),

        //location
        MyTextField(
          validator: InputValidations.commonValidation,
          label: bankNameSUtil,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.datetime,
          topLabel: bankNameSUtil,
        ),
        height(15),

        //date of birth
        MyTextField(
          validator: InputValidations.commonValidation,
          label: routingNoSUtil,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.datetime,
          topLabel: routingNoSUtil,
        ),
        height(15),
      ],
    );
  }

  _header() {
    return Column(
      children: [
        SizedBox.square(
            dimension: sizeW(40),
            child: MyBox(
              color: primaryColorSwatch.shade100,
              radius: 7,
              child: const Icon(
                Icons.wallet_outlined,
                color: primaryColorSwatch,
              ),
            )),
        height(10),

        /// Previous Text
        // Text(
        //     "Congratulations! You have successfully recharged \$40 from airtel. Enjoy your seamless communication experience.",
        //     style: med14.copyWith(color: textBlackColor),
        //     maxLines: 5,
        //     textAlign: TextAlign.center,
        //     overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
