import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// Using Sage Green as an example
final FlexSchemeColor schemeColor = FlexSchemeColor.from(
  primary: const Color(0xFF8CAA98),
  secondary: const Color(0xFFD8A7B1),
);

// Using Sage Green as an example
final FlexSchemeColor schemeColorDark = FlexSchemeColor.from(
  primary: const Color(0xFF8CAA98),
  secondary: const Color(0xFFD8A7B1),
);

/// Application theme class
class AppTheme {
  AppTheme._();

  ///new colors

  // static ThemeData lightTheme = FlexThemeData.light(
  //   //colors: schemeColor,
  //   scheme: FlexScheme.tealM3,
  //   surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  //   blendLevel: 9,
  //   subThemesData: const FlexSubThemesData(
  //     blendOnLevel: 10,
  //     blendTextTheme: true,
  //     useTextTheme: true,
  //   ),
  // );

  static ThemeData darkTheme = FlexThemeData.dark(
    //colors: schemeColorDark,
    scheme: FlexScheme.blueWhale,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 15,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      blendTextTheme: true,
      useTextTheme: true,
      defaultRadius: 8.0,
    ),
    visualDensity: FlexColorScheme
        .comfortablePlatformDensity, // Better readability in dark mode
  );

  ///old colors

  /// Light Theme
  // static ThemeData lightTheme = FlexThemeData.light(
  //   visualDensity: FlexColorScheme.comfortablePlatformDensity,
  //   swapLegacyOnMaterial3: false,
  //   useMaterial3: true,
  //   scheme: FlexScheme.gold,
  //   surfaceTint: Colors.transparent,
  //   textTheme: const TextTheme(),
  //   dialogBackground: const Color.fromARGB(255, 174, 174, 174),
  //   secondary: const Color.fromARGB(255, 238, 238, 238),
  //   secondaryContainer: Colors.grey.shade400,
  //   subThemesData: const FlexSubThemesData(
  //     blendOnLevel: 10,
  //     blendOnColors: false,
  //     useTextTheme: true,
  //     useM2StyleDividerInM3: true,
  //     alignedDropdown: true,
  //     useInputDecoratorThemeInDialogs: true,
  //   ),
  // );

  /// Dark Theme
  // static ThemeData darkTheme = FlexThemeData.dark(
  //   visualDensity: FlexColorScheme.comfortablePlatformDensity,
  //   swapLegacyOnMaterial3: false,
  //   useMaterial3: true,
  //   subThemesData: const FlexSubThemesData(
  //     blendOnLevel: 20,
  //     useTextTheme: true,
  //     useM2StyleDividerInM3: true,
  //     alignedDropdown: true,
  //     useInputDecoratorThemeInDialogs: true,
  //   ),
  //   dialogBackground: Colors.grey.shade800,
  //   secondary: const Color.fromARGB(255, 15, 15, 15),
  //   secondaryContainer: const Color.fromARGB(255, 5, 5, 5),
  //   scheme: FlexScheme.deepPurple,
  //   surfaceTint: Colors.transparent,
  //   tabBarStyle: FlexTabBarStyle.forBackground,
  // );
}
