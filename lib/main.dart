import 'package:flutter/material.dart';
import 'package:yozil/app.dart';
import 'package:yozil/core/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.initializeDependencies();

  runApp(const MyApp());
}
