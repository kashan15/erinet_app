import '../components/new_custom_dialog.dart';
import 'Package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/custom_drawer.dart';
import '../components/text_field.dart';
import '../components/custom_bottom_tab_bar.dart';
import '../components/custom_buttons.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_widgets.dart';
import '../utils/input_validations.dart';
import '../utils/string_utils.dart';

class BankDetailsScreen extends StatelessWidget {
  BankDetailsScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: const SafeArea(
        left: false,
        right: false,
        top: false,
        child: CustomBottomTabBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: sizeW(30), vertical: sizeH(20)),
          child: Column(
            children: [
              //heading
              heading(bankAccountDetailsSUtil.split(' ')[0],
                  '${bankAccountDetailsSUtil.split(' ')[1]} ${bankAccountDetailsSUtil.split(' ')[2]}'),

              height(35),

              //form
              _form(),
              height(20),

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
                    title: "Details have been save\n\tSuccessfully",

                  ),

                ).then((value) => Get.back()),
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

        //date of birth
        MyTextField(
          validator: InputValidations.commonValidation,
          label: routingNoSUtil,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.datetime,
          topLabel: routingNoSUtil,
        ),
        height(15),

        //gender
        MyTextField(
          validator: InputValidations.commonValidation,
          label: accountTypeSUtil,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.datetime,
          topLabel: accountTypeSUtil,
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

        //location
        MyTextField(
          validator: InputValidations.commonValidation,
          label: bankLocationSUtil,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.datetime,
          topLabel: bankLocationSUtil,
        ),
        height(15),
      ],
    );
  }
}
