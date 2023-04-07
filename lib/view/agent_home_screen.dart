import 'package:erinet_app/utils/assets_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../components/custom_widgets.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_bottom_tab_bar.dart';
import '../components/custom_drawer.dart';
import '../controller/home_controller.dart';
import '../utils/colors_utils.dart';
import '../utils/string_utils.dart';
import '../utils/textStyles.dart';

class AgentHomeScreen extends GetView<HomeController> {
  AgentHomeScreen({Key? key}) : super(key: key);
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
        child: CustomBottomTabBar(),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: sizeW(30), vertical: sizeH(20)),
        child: Column(
          children: [
            //heading
            heading(
                agentPanelSUtil.split(' ')[0], agentPanelSUtil.split(' ')[1]),

            height(30),

            // _body(),
            _bodyNew(),
          ],
        ),
      ),
    );
  }


  Widget _bodyNew() {
    return Expanded(
      child: GridView.builder(
        itemCount: controller.agentHomeList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: sizeW(10),
            crossAxisSpacing: sizeW(10)),
        itemBuilder: (context, index) => _cardView(index),
      ),
    );
  }

  Widget _cardView(int index) {
    return GestureDetector(
      onTap: () => controller.onAgentHomeNextRoute(index),
      child: Card(
        // shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        color: primaryColorSwatch.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: sizeW(80),
              child: FittedBox(
                child: Padding(
                  padding:  EdgeInsets.all(sizeW(30)),
                  child: genericAsset(
                   asset: controller.agentHomeList[index].icon,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(sizeW(10)),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  textAlign: TextAlign.center,
                  controller.agentHomeList[index].title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: med16.copyWith(color: primaryColorSwatch),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
  Widget _body() {
    return Expanded(
      child: ListView.builder(
          itemCount: controller.agentHomeList.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: SizedBox.square(
                  dimension: sizeW(45),
                  child: MyBox(
                    shadowColor: Colors.grey,
                    color: primaryColorSwatch.shade100,
                    radius: 7,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: genericAsset(
                        asset: Assets.backIcon,
                        iconColor: primaryColorSwatch,
                      ),
                    ),
                  )),
              title: Text(
                controller.agentHomeList[index].title,
                style: med16.copyWith(color: primaryColorSwatch),
              ),
              minVerticalPadding: 20,
              trailing: GestureDetector(
                onTap: () => controller.onAgentHomeNextRoute(index),
                child: SizedBox.square(
                    dimension: sizeW(30),
                    child: MyBox(
                      shadowColor: Colors.grey,
                      color: textGreyColor,
                      radius: 7,
                      child: genericAsset(
                        asset: controller.agentHomeList[index].icon,
                        iconColor: primaryColorSwatch,
                      ),
                    )),
              ),
            );
          }),
    );
  }*/
