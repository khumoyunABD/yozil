import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);

  // Common colors
  Color get primaryColor => colorScheme.primary;
  Color get backgroundColor => colorScheme.surface;
  Color get surfaceColor => colorScheme.surface;

  // Typography
  TextStyle? get headlineLarge => textTheme.headlineLarge;
  TextStyle? get bodyLarge => textTheme.bodyLarge;

  // Common theme properties
  // EdgeInsets get padding => const EdgeInsets.all(16);
  // double get borderRadius => 8.0;
}
