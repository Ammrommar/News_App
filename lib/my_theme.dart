import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Color(0xff39A552);
  static Color whiteColor = Color(0xffffffff);
  static Color darkGreyColor = Color(0xff707070);
  static Color redColor = Color(0xffC91C22);
  static Color darkBlueColor = Color(0xff003E90);
  static Color pinkColor = Color(0xffED1E79);
  static Color brownColor = Color(0xffCF7E48);
  static Color blueColor = Color(0xff4882CF);
  static Color yellowColor = Color(0xffF2D352);
  static Color blackColor = Color(0xff303030);
  static Color greyColor = Color(0xff42505C);

  static ThemeData lightTheme = ThemeData(
      primaryColor: MyTheme.primaryColor,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: MyTheme.whiteColor),
          backgroundColor: MyTheme.primaryColor,
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)))),
      textTheme: TextTheme(
        titleSmall: TextStyle(
          fontSize: 13,
          color: Color(0xff42505C),
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Color(0xff42505C),
        ),
        titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: MyTheme.darkGreyColor),
        bodyLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: MyTheme.darkGreyColor),
      ));
}
