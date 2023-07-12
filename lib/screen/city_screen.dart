import 'package:clima/const/style.dart';
import 'package:clima/const/text.dart';
import 'package:clima/controller/city_controller.dart';
import 'package:clima/screen/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CityScreen extends StatelessWidget {
  CityScreen({super.key});
  final CityController cityController = Get.find<CityController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: hintTextStyle,
                  decoration: textFieldInputDecoration,
                  onChanged: (value) {
                    cityController.cityValueName.value = value;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  cityController.getCityData();
                  Get.to(() => LocationScreen());
                },
                child: const Text(
                  weatherText,
                  style: buttonStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
