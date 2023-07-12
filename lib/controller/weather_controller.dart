import 'dart:convert';
import 'dart:math';

import 'package:clima/const/const.dart';
import 'package:clima/screen/location_screen.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await getCurrentLocation();
  }

  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  RxInt temperature = 0.obs;
  RxString weatherIcon = RxString('');
  RxString cityName = RxString('');
  RxString weatherMessage = RxString('');

  var allData;

  getCurrentLocation() async {
    // getData();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      // print(latitude.value);
      // print(longitude.value);
      getData();
    } catch (e) {
      //  print(e);
    }
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => LocationScreen());
    });
  }

  getData() async {
    Uri uri = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=${latitude.value},${longitude.value}&aqi=no');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      allData = jsonDecode(data);
      catchData(allData);
      return allData;
    } else {
      print(response.statusCode);
    }
  }

  catchData(allData) {
    if (allData == null) {
      temperature.value = 0;
      weatherIcon.value = 'Error';
      weatherMessage.value = 'Unable to get weather data';
      cityName.value = '';
      return;
    } else {
      double temp = allData['current']['temp_c'];
      temperature.value = temp.toInt();
      weatherIcon.value = allData['current']['condition']['icon'];
      weatherMessage.value = allData['current']['condition']['text'];
      cityName.value = allData['location']['name'];
    }
  }
}
