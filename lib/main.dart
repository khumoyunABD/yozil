import 'package:flutter/material.dart';
import 'package:yozil/app.dart';
import 'package:yozil/core/di/injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  di.initializeDependencies();

  runApp(const MyApp());
}
