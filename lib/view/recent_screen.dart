import 'package:erinet_app/components/custom_app_bar.dart';
import 'package:erinet_app/components/custom_bottom_tab_bar.dart';
import 'package:erinet_app/components/custom_drawer.dart';
import 'package:flutter/material.dart';

class RecentScreen extends StatelessWidget {
  RecentScreen({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      drawer: const CustomDrawer(),
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: const SafeArea(
        left: false,
        right: false,
        top: false,
        child: CustomBottomTabBar(),
      ),
      body: const Center(
        child: Text("coming Soon"),
      ),
    );
  }
}
