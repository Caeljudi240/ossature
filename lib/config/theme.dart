import 'package:flutter/material.dart';
import 'package:ossature_core/theme/theme.dart';

AppTheme initTheme() {
  final appTheme = AppTheme(
    themeData: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Poppins",
      splashColor: Colors.transparent,
      hoverColor: const Color.fromRGBO(0, 0, 0, 0),
      focusColor: Colors.transparent,
      canvasColor: Colors.white,
    ),
    themeDataDark: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      fontFamily: "Poppins",
      splashColor: Colors.transparent,
      hoverColor: const Color.fromRGBO(0, 0, 0, 0),
      focusColor: Colors.transparent,
      canvasColor: Colors.black,
    ),
  );

  return appTheme;
}
