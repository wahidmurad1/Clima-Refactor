import 'package:clima/binder/allcontrollerbinding.dart';
import 'package:clima/screen/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  AllControllerBinder().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
