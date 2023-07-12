import 'package:clima/const/color.dart';
import 'package:clima/const/style.dart';
import 'package:clima/controller/weather_controller.dart';
import 'package:clima/screen/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});
  final WeatherController weatherController = Get.find<WeatherController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/location_background.jpeg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async {
                        weatherController.getCurrentLocation();
                      },
                      child: const Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        Get.to(() => CityScreen());
                        // var typedName = await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return CityScreen();
                        //     },
                        //   ),
                        // );

                        // if (typedName != null) {
                        //   var weatherData =
                        //       await weather.getCityWeather(typedName);
                        //   updateUI(weatherData);
                        // }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '${weatherController.temperature.value}', //'$temperature°',
                      style: tempTextStyle,
                    ),
                    // Text(
                    //   weatherController.weatherIcon.value, //weatherIcon,
                    //   style: conditionTextStyle,
                    // ),
                    Image.network(
                      'https:${weatherController.weatherIcon.value}',
                      scale: 0.3,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    '${weatherController.weatherMessage.value} in ${weatherController.cityName.value}', //'$weatherMessage in $cityName',
                    textAlign: TextAlign.right,
                    style: messageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
