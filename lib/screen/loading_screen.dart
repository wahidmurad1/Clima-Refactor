import 'package:clima/const/color.dart';
import 'package:clima/controller/weather_controller.dart';
import 'package:clima/screen/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoadingScreen extends StatelessWidget {
  LoadingScreen({super.key});
  final WeatherController weatherController = Get.find<WeatherController>();
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
        body: Center(
          child: SpinKitDoubleBounce(
            color: whiteColor,
            size: 100,
            // duration: Duration(seconds: 10),
          ),
        ),
      ),
    );
  }
}


// SpinKitDoubleBounce(
//             color: Colors.red,
//             size: 100.0,
//           ),