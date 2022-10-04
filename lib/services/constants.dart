import 'package:flutter/material.dart';

final kProfileTextStyle = TextStyle(
  fontSize: 25.0,
  color: Colors.white,
);

final kDrawerListStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
);

final String kApi = 'AIzaSyBRSjFpkj9vWq4ETzy-mG5fCmhleGPdmnY';

const String kGoogleImage = 'assets/images/google.png';
const String kFacebookImage = 'assets/images/facebook.png';

const String kOpenCageApiKey = 'f29cf18b10224e27b8931981380b747a';
const kTomsApiKey = 'vA9uQILIGUAG86z9xCTSkETjqg7ZCiGa';


const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
  ),
);

// Colors that we use in our app
const kPrimaryColor = Colors.blueGrey;
const kTextColor = Colors.white;
const kBackgroundColor = Color(0xffe3f1f4);

const double kDefaultPadding = 20.0;
const double kPaddingS = 8.0;
const double kPaddingM = 16.0;
const double kPaddingL = 32.0;