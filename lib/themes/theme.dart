import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rcm_app/constant/constant.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    primaryTextTheme: TextTheme(
      headline6: GoogleFonts.poppins(color: Colors.white),
    ),
    primaryIconTheme: IconThemeData(color: Colors.white),
    brightness: Brightness.light,
  );
}
