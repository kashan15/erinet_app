import 'package:erinet_app/utils/colors_utils.dart';
import 'package:erinet_app/utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationPopup extends StatefulWidget {
  const LocationPopup({Key? key}) : super(key: key);

  @override
  State<LocationPopup> createState() => _LocationPopupState();
}

class _LocationPopupState extends State<LocationPopup> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.32,
        width: MediaQuery.of(context).size.width * 1.5,
        child:  Dialog(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Icon(Icons.location_on, color: locationColor,
                size: MediaQuery.of(context).size.height * 0.05,),
              const SizedBox(height: 10,),
              //const Text("Allow Erinet App to access\nthis device location?",),
              RichText(
                text: const TextSpan(
                  text: 'Allow ',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.black),
                  children:  <TextSpan>[
                    TextSpan(text: 'Erinet App', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.black)),
                    TextSpan(text: ' App to access\nthis device location?',
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15,color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Flexible(
                child: TextButton(
                    onPressed: ()=> Get.toNamed(kOnBoardingScreen),
                    child:  const Text("Allow",
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15,color: Colors.blue),
                    ),
                ),
              ),
              //const SizedBox(height: 5,),
              Flexible(
                child: TextButton(onPressed: ()=> Get.toNamed(kOnBoardingScreen),
                    child: const Text("Don't allow",
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15,color: Colors.blue),
                    )
                ),
              ),
              //const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
