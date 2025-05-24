import 'package:currency_app/core/theming/color.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: ColorsManager.dark),
    primaryColor: ColorsManager.mainBlue,
    scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
    cardColor: ColorsManager.dark,
    indicatorColor: ColorsManager.gray);
