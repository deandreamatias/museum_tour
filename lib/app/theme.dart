import 'package:flutter/material.dart';

class CustomTheme {
  static const Color primary = Color(0xFFF5CB5C);
  static const Color background = Color(0xFFF6F3E1);
  static const Color textHigh = Color(0xFF242423);
  static const Color textMedium = Color(0xFF333533);
  static const Map<int, Color> _primarySwatch = <int, Color>{
    50: Color.fromRGBO(245, 203, 92, .1),
    100: Color.fromRGBO(245, 203, 92, .2),
    200: Color.fromRGBO(245, 203, 92, .3),
    300: Color.fromRGBO(245, 203, 92, .4),
    400: Color.fromRGBO(245, 203, 92, .5),
    500: Color.fromRGBO(245, 203, 92, .6),
    600: Color.fromRGBO(245, 203, 92, .7),
    700: Color.fromRGBO(245, 203, 92, .8),
    800: Color.fromRGBO(245, 203, 92, .9),
    900: Color.fromRGBO(245, 203, 92, 1),
  };

  static final textTheme = TextTheme(
    bodyText1: ThemeData.light().textTheme.bodyText1!.copyWith(color: textHigh),
  );

  final List<ThemeData> availableThemes = <ThemeData>[
    // Light theme
    ThemeData(
      fontFamily: 'Quicksand',
      colorScheme: const ColorScheme(
        primary: primary,
        primaryVariant: primary,
        secondary: primary,
        secondaryVariant: primary,
        surface: Colors.white,
        background: background,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.black,
        brightness: Brightness.light,
      ),
      primaryColor: primary,
      dialogBackgroundColor: Colors.white,
      scaffoldBackgroundColor: background,
      backgroundColor: background,
      primarySwatch: const MaterialColor(0xFFF5CB5C, _primarySwatch),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        contentPadding: EdgeInsets.all(16.0),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(textMedium),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(16.0),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(textHigh)),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(color: primary)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        secondarySelectedColor: primary,
        labelStyle: textTheme.bodyText1!,
        secondaryLabelStyle: const TextStyle(),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(4),
        selectedColor: primary,
        disabledColor: _primarySwatch.values.first,
        side: const BorderSide(color: primary),
      ),
      textTheme: textTheme,
    ),
    // Dark theme
    ThemeData(
      fontFamily: 'Quicksand',
      colorScheme: const ColorScheme(
        primary: primary,
        primaryVariant: primary,
        secondary: primary,
        secondaryVariant: primary,
        surface: textHigh,
        background: textMedium,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.black,
        brightness: Brightness.dark,
      ),
      primaryColor: primary,
      backgroundColor: textMedium,
      primarySwatch: const MaterialColor(0xFFE40505, _primarySwatch),
      toggleableActiveColor: primary,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        contentPadding: EdgeInsets.all(0.0),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: textHigh,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(primary),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(16.0),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(color: primary)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
      ),
    ),
  ];
}
