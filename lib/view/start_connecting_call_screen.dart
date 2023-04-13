import 'package:erinet_app/components/text_field.dart';
import 'package:erinet_app/utils/assets_utils.dart';
import 'package:erinet_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'dart:math' as math;
import '../components/custom_app_bar.dart';
import '../components/custom_bottom_tab_bar.dart';
import '../components/custom_buttons.dart';
import '../components/custom_drawer.dart';
import '../components/custom_widgets.dart';
import '../utils/input_validations.dart';
import '../utils/route_utils.dart';
import '../utils/string_utils.dart';


final String localUserID = math.Random().nextInt(10000).toString();

class StartConnectingCallScreen extends StatelessWidget {
  StartConnectingCallScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final callingId = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: const SafeArea(
        left: false,
        right: false,
        child: CustomBottomTabBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: sizeW(30), vertical: sizeH(20)),
          child: Column(
            children: [
              //heading
              heading(startConnectingSUtil.split(' ')[0],
                  startConnectingSUtil.split(' ')[1]),

              height(30),
              _body(),
              // _bodyNew(),
            ],
          ),
        ),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        _form(Assets.userProfileIcon, enterReceiverNoSUtil),
        height(30),

        // _form(Assets.userProfileIcon, enterDialerNoSUtil),
        // height(30),

        // TextButton(
        //     onPressed: (){},
        //     child: Center(
        //       child: Text("Start Connecting"),
        //     )
        // )
        /// Previous Button
        Button(
            width: Get.width,
            text: startConnectingSUtil,
            onPressed: () => Get.to(CallPage(callingId: callingId.text.toString()))
              //Get.toNamed(kStartCallingScreen)
        ),

        height(60),
        
        Button(
            width: Get.width,
            text: "Call Via Network",
            onPressed: () => 
               FlutterPhoneDirectCaller.callNumber('+923232469200'),
          //Get.toNamed(kStartCallingScreen)
        ),
      ],
    );
  }

  _form(asset, label) {
    return Column(
      children: [
        circleAvatar(
          bgColor: Colors.white,
          asset: asset,
          size: sizeW(100),
        ),
        height(15),

        //mobile number
        MyTextField(
          validator: InputValidations.commonValidation,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          topLabel: label,
          controller: callingId
          //TextEditingController(text: "0800222111"),
        ),
      ],
    );
  }
}

class CallPage extends StatelessWidget {

  final String callingId;
  const CallPage({Key? key,
    required this.callingId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ZegoUIKitPrebuiltCall(
            appID: Utils.appId,
            appSign: Utils.appSignin,
            callID: callingId,
            userID: localUserID,
            userName: 'user_$localUserID',
            config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()
              ..onOnlySelfInRoom = (context){
                Navigator.pop(context);
              }

        )
    );
  }
}
