import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'route_management/route_management.dart';
import 'utils/colors_utils.dart';
import 'utils/route_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
    builder: (context, child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Erinet App',
        theme:
        ThemeData(
          primarySwatch: primaryColorSwatch,
          fontFamily:'Nexa',
        ),
        initialRoute: kWelcomeScreen,
        getPages: RouteManagement.getPages(),

        // initialBinding: ControllerBinding(),
      );
    }
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final geolocator =
//   Geolocator.getCurrentPosition(forceAndroidLocationManager: true);
//    Position? _currentPosition;
//   String currentAddress = "";
//
//   void getCurrentLocation() {
//     Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) {
//       setState(() {
//         _currentPosition = position;
//       });
//       getAddressFromLatLng();
//     }).catchError((e) {
//       print(e);
//     });
//   }
//
//   Future<void> requestLocationPermission() async {
//     final status = await Permission.location.request();
//     if (status.isGranted) {
//       // Permission granted, do something
//     } else {
//       // Permission denied, handle error
//     }
//   }
//
//   void getAddressFromLatLng() async {
//     try {
//       List<Placemark> p = await placemarkFromCoordinates(
//           _currentPosition!.latitude, _currentPosition!.longitude);
//
//       Placemark place = p[0];
//
//       setState(() {
//         currentAddress =
//         "${place.thoroughfare},${place.subThoroughfare},${place.name}, ${place.subLocality}";
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Location"),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).canvasColor,
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: Column(
//                   children: <Widget>[
//                     Row(
//                       children: <Widget>[
//                         Icon(Icons.location_on),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               ElevatedButton(
//                                 child: Text(
//                                   'Get Location',
//                                   style: Theme.of(context).textTheme.caption,
//                                 ),
//                                 onPressed: getCurrentLocation,
//                               ),
//                               if (_currentPosition != null &&
//                                   currentAddress != null)
//                                 Text(currentAddress,
//                                     style: TextStyle(fontSize: 20.0))
//                               else
//                                 Text("Could'nt fetch the location"),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 8,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }