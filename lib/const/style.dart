import 'package:clima/const/color.dart';
import 'package:flutter/material.dart';

const tempTextStyle =
    TextStyle(fontFamily: 'Poppins', fontSize: 100.0, color: whiteColor);
const conditionTextStyle = TextStyle(
  fontSize: 100.0,
  color: whiteColor,
);
const messageTextStyle = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 60.0,
  color: whiteColor,
);
const textFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
const buttonStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Poppins',
);
const hintTextStyle = TextStyle(
  fontSize: 14,
  fontFamily: 'Poppins',
  color: blackColor,
);
