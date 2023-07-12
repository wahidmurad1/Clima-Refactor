import 'package:clima/controller/city_controller.dart';
import 'package:clima/controller/weather_controller.dart';
import 'package:get/get.dart';

class AllControllerBinder implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherController>(() => WeatherController());
    Get.lazyPut<CityController>(() => CityController());
  }
}
