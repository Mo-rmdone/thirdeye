import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import '../colors.dart';
import '../styles.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.teal,
  scaffoldBackgroundColor: darkBackgroundColor,
  floatingActionButtonTheme:  FloatingActionButtonThemeData(
    backgroundColor: mainColor,
  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    backgroundColor: darkBackgroundColor,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: darkBackgroundColor,
      statusBarBrightness: Brightness.light,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),

  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: mainColor,
    unselectedItemColor: Colors.grey,
    backgroundColor: HexColor('002147'),

  ),
);

ThemeData lightTheme = ThemeData(

  primarySwatch:Colors.purple,
  scaffoldBackgroundColor: lightBackgroundColor,
  floatingActionButtonTheme:  FloatingActionButtonThemeData(
    backgroundColor: mainColor,
  ),
  appBarTheme:  const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    titleSpacing: 20,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  textTheme: const TextTheme(

    bodyLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
  ),
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: mainColor,
    unselectedItemColor: Colors.blueGrey,
    backgroundColor: Colors.white,
    elevation: 0

  ),
);

InputDecorationTheme inputDecorationTheme =  InputDecorationTheme(
  fillColor: const Color(0xFFFBFBFB),
  filled: true,
  border: defaultOutlineInputBorder,
  enabledBorder: defaultOutlineInputBorder,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: const BorderSide(color: Color(0xFFF2994A)),),);
