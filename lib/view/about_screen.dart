import '../components/custom_drawer.dart';
import '../utils/string_utils.dart';
import 'package:flutter/material.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_bottom_tab_bar.dart';
import '../components/custom_widgets.dart';
import '../utils/textStyles.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: heading(aboutSUtil, erinetSUtil)),
              height(30),
              Text(
                aboutTextSUtil,
                textAlign: TextAlign.center,
                style: med12,
              ),
              height(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.whatshot_outlined),
                  width(10),
                  Text(
                    connectUsSUtil,
                    textAlign: TextAlign.center,
                    style: med12.copyWith(decoration: TextDecoration.underline,),
                  ),
                ],
              ),
              height(30),
            ],

          ),
        ),
      ),
    );
  }
}
