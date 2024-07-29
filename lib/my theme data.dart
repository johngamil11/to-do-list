import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_todo_list/app_color.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColor.primaryAppColor,
      scaffoldBackgroundColor: AppColor.lightBackGround,
      appBarTheme: AppBarTheme(
        color: AppColor.primaryAppColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColor.primaryAppColor,
        unselectedItemColor: AppColor.greyColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
          color: AppColor.whiteColor //navigation color in light mode
          ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColor.primaryAppColor,
          elevation: 0,
          iconSize: 25,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
              side: BorderSide(width: 5, color: Colors.white))),
      textTheme: TextTheme(
          titleLarge: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            color: AppColor.whiteColor),
        titleMedium: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColor.blackColor),
        titleSmall: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppColor.blackColor),
      ));

  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColor.primaryAppColor,
      scaffoldBackgroundColor: AppColor.darkBackGround,
      appBarTheme: AppBarTheme(
        color: AppColor.primaryAppColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColor.primaryAppColor,
        unselectedItemColor: AppColor.greyColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
          color: AppColor.dark //navigation color in light mode
          ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColor.primaryAppColor,
          elevation: 0,
          iconSize: 25,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
              side: BorderSide(width: 5, color: AppColor.dark))),
      textTheme: TextTheme(
          titleLarge: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            color: AppColor.blackColor),
        titleMedium: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColor.whiteColor),
        titleSmall: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppColor.whiteColor),
      ));
}
