import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color primaryColor = Color(0xff005EAD);
const Color lighterDarkColor = Color(0xff69452E);
const secondaryColor = Color(0xffffffff);
const Color kGreyColor = Color(0xff818185);
const Color blackColor = Color(0xff000000);
const String fontBold = 'Cairo-Bold';
const String fontSemiBold = 'Cairo-SemiBold';
const String fontMedium = 'Cairo-Medium';
const String fontRegular = 'Cairo-Regular';
const height = 1.5;


final lightTheme = ThemeData(
  primaryColor: primaryColor,
  brightness: Brightness.light,
  primaryColorDark: blackColor,
  scaffoldBackgroundColor: const Color(0xffffffff),
  hintColor: const Color(0xffF7F6F6),
  cardColor: const Color(0xffffffff),
  dividerColor: const Color(0xffD0D5DD),
  shadowColor: blackColor.withOpacity(0.15),
  dividerTheme: const DividerThemeData(
    space: 0,
    thickness: 1,
    color: Color(0xffF7F6F6),
  ),
  // iconTheme: const IconThemeData(
  //   color: kYellowColor,
  // ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.red,
    //   primaryColorDark: const Color(0xFF232323),
    backgroundColor: secondaryColor,
    accentColor: const Color(0xff494949),
    errorColor: Colors.red,
  ).copyWith(
    secondaryContainer: const Color(0xff06bd3d),
    primaryContainer: const Color(0xffF9F0E1),
    onSecondary: const Color(0xffF67D31),
    secondary: const Color(0xffffffff),
    outline: const Color(0xff818185),
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: secondaryColor,
      statusBarIconBrightness: Brightness.light,
    ),
    color: Color(0xffffffff),
    elevation: 0,
    foregroundColor: Color(0xffF9F0E1),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontFamily: fontBold,
      fontWeight: FontWeight.w700,
      color: blackColor,
    ),
    //  backgroundColor: secondaryColor,
    centerTitle: true,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Color(0xffffffff),
    hintStyle: TextStyle(
      fontSize: 14,
      fontFamily: 'Cairo-Regular',
    ),

  ),
  fontFamily: fontBold,
  textTheme:  const TextTheme(
    titleLarge: TextStyle(
      fontSize: 32,
      fontFamily: fontBold,
      fontWeight: FontWeight.bold,
      color: blackColor,
      height: height,
    ),
    titleMedium: TextStyle(
      fontSize: 22,
      fontFamily: fontBold,
      fontWeight: FontWeight.bold,
      color: blackColor,
      height: height,
    ),
    titleSmall: TextStyle(
      fontSize: 20.0,
      color: blackColor,
      fontFamily: fontRegular,
      fontWeight: FontWeight.bold,
      height: height,
    ),

    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: blackColor,
      fontFamily: fontSemiBold,
      fontWeight: FontWeight.w600,
      height: height,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      color: blackColor,
      fontFamily: fontMedium,
      fontWeight: FontWeight.w500,
      height: height,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      color: blackColor,
      fontFamily: fontRegular,
      fontWeight: FontWeight.w400,
      height: height,
    ),
    displayLarge: TextStyle(
      fontSize: 18.0,
      color: kGreyColor,
      fontFamily: fontSemiBold,
      fontWeight: FontWeight.w600,
      height: height,
    ),
    displayMedium: TextStyle(
      fontSize: 16.0,
      color: kGreyColor,
      fontFamily: fontMedium,
      fontWeight: FontWeight.w500,
      height: height,
    ),
    displaySmall: TextStyle(
      fontSize: 14.0,
      color: kGreyColor,
      fontFamily: fontRegular,
      fontWeight: FontWeight.w400,
      height: height,
    ),
    labelLarge: TextStyle(
      fontSize: 16.0,
      color: Colors.white,
      fontFamily: fontSemiBold,
      fontWeight: FontWeight.w600,
      height: height,
    ),
    labelMedium: TextStyle(
      fontSize: 14.0,
      color: Colors.white,
      fontFamily: fontMedium,
      fontWeight: FontWeight.w500,
      height: height,
    ),
    labelSmall: TextStyle(
      fontSize: 12.0,
      color: Colors.white,
      fontFamily: fontRegular,
      fontWeight: FontWeight.w400,
      height: height,
    ),
    headlineSmall: TextStyle(
      fontSize: 14.0,
      color: primaryColor,
      fontFamily: fontRegular,
      fontWeight: FontWeight.w400,
      height: height,
    ),
    headlineMedium: TextStyle(
      fontSize: 16.0,
      color: primaryColor,
      fontFamily: fontMedium,
      fontWeight: FontWeight.w500,
      height: height,
    ),
    headlineLarge: TextStyle(
      fontSize: 18.0,
      color: primaryColor,
      fontFamily: fontSemiBold,
      fontWeight: FontWeight.w600,
      height: height,
    ),

  ),
);