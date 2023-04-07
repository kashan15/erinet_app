import '../utils/assets_utils.dart';
import '../utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(
      {Key? key,
      // this.back,
      this.notification,
      this.scaffoldKey,
      this.height = kToolbarHeight,
      this.onTap ,
      this.searchBar})
      : super(key: key);

  GlobalKey<ScaffoldState>? scaffoldKey;

  // bool? back = false;
  Widget? notification;
  Widget? searchBar;
  final double height;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(

      elevation: 0.0,
      iconTheme: const IconThemeData(
        color: primaryColorSwatch, //change your color here
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: sizeW(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            scaffoldKey != null
                ? iconBox(
                    Icons.menu,
                    onTap: () => scaffoldKey!.currentState!.openDrawer(),
                  )
                : const SizedBox(),

            iconBox(
              Assets.backIcon,
              onTap: ()=> onTap??Get.back(),),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  Widget iconBox(var icon, {void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          width: kToolbarHeight * 0.7,
          height: kToolbarHeight * 0.7,
          // dimension: kToolbarHeight, //sizeW(10),
          child: MyBox(
            color: primaryColorSwatch.shade100,
            radius: 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: genericAsset(
                asset:icon,
                //iconHeight: myIconHeight,
                iconColor: primaryColorSwatch,
              ),
            ),
          )), //()=> Get.back(),
    );
  }
}
