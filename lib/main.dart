import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yozil/app.dart';
import 'package:yozil/core/di/injection_container.dart' as di;
import 'package:yozil/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  di.initializeDependencies();

  runApp(const MyApp());
}
