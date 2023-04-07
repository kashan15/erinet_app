import 'package:flutter/material.dart';

class Assets{
  static String welcome = 'assets/images/welcome-screen.jpeg';
  static const String vector = 'assets/images/vector.png';
  static const String delivery_amico = 'assets/images/Delivery-amico.png';
  static const String shipping_rafiki = 'assets/images/Free shipping-rafiki.png';

  static const String call = 'assets/images/call.png';
  static const String headphone = 'assets/images/headphone.png';
  static const String onboard1 = 'assets/images/onboard-1.png';
  static const String onboard2 = 'assets/images/onboard-2.png';
  static const String google = 'assets/images/google.png';
  static const String microsoft = 'assets/images/microsoft.png';
  static const String apple = 'assets/images/apple.png';
  static const String men = 'assets/images/men.jpeg';
  static const String camera = 'assets/images/camera.png';
  static const String agent = 'assets/images/1.png';
  static const String user = 'assets/images/2.png';
  static const String agentBg = 'assets/images/bg_agent.png';
  static const String userBg = 'assets/images/bg_user.png';
  static const String airtelLogo = 'assets/images/Airtel_logo.png';
  static const String backIcon = 'assets/images/back.png';
  static const String backIcon1 = 'assets/images/backIcon.png';
  static const String backIcon2 = 'assets/images/backIcon1.png';
  static const String searchIcon = 'assets/images/search-icon.png';
  static const String profile1 = 'assets/images/profile1.png';
  static const String profile = 'assets/images/profile.png';

  static const String bidIcon = 'assets/images/bid.png';
  static const String walletIcon = 'assets/images/wallet.png';
  static const String callHistoryIcon = 'assets/images/call-history.png';
  static const String withdrawMoneyIcon = 'assets/images/withdraw-money.png';
  static const String userProfileIcon = 'assets/images/profile.png';
}

Widget genericAsset({var asset,Color? iconColor,BoxFit? boxFit,}){
  return asset.runtimeType != IconData
      ? Image(
    image: AssetImage(asset,),
    fit: boxFit ?? BoxFit.cover,
    //height: iconHeight,
  )
      : Icon(asset,color:iconColor);
}