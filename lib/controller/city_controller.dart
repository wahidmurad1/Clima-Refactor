import 'dart:convert';

import 'package:clima/const/const.dart';
import 'package:clima/controller/weather_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CityController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCityData();
  }

  WeatherController weatherController = Get.find<WeatherController>();
  RxString cityValueName = RxString('');
  var allData2;

  getCityData() async {
    Uri uri = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=${cityValueName.value}&aqi=no');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      allData2 = jsonDecode(data);
      print(allData2);
      catchCityData(allData2);
      return allData2;
    } else {
      print(response.statusCode);
    }
  }

  catchCityData(allData2) {
    if (allData2 == null) {
      weatherController.temperature.value = 0;
      weatherController.weatherIcon.value = 'Error';
      weatherController.weatherMessage.value = 'Unable to get weather data';
      weatherController.cityName.value = '';
      return;
    } else {
      double temp = allData2['current']['temp_c'];
      weatherController.temperature.value = temp.toInt();
      weatherController.weatherIcon.value =
          allData2['current']['condition']['icon'];
      weatherController.weatherMessage.value =
          allData2['current']['condition']['text'];
      weatherController.cityName.value = allData2['location']['name'];
    }
  }
}
