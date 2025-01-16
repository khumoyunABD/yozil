import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yozil/core/core.dart';
import 'package:yozil/presentation/presentation.dart';

class InitialCheckPage extends StatefulWidget {
  const InitialCheckPage({super.key});

  @override
  InitialCheckPageState createState() => InitialCheckPageState();
}

class InitialCheckPageState extends State<InitialCheckPage> {
  @override
  void initState() {
    super.initState();
    // Use addPostFrameCallback to ensure the widget is fully built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkPreferences();
    });
  }

  Future<void> _checkPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? selectedService = prefs.getString('selected_service');

      // Adding a small delay to prevent immediate navigation
      await Future.delayed(const Duration(milliseconds: 100));

      if (!mounted) return;

      if (selectedService == null) {
        // No preference found, navigate to ServiceSelectorPage
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ServiceSelectorPage(),
          ),
        );
      } else {
        // Preference found, navigate to HomePage
        log('Selected Preference: $selectedService');
        context.replace(ScreenPath.home);
      }
    } catch (e) {
      log('Error checking preferences: $e');
      // In case of error, default to ServiceSelectorPage
      if (!mounted) return;
      context.replace(ScreenPath.serviceSelector);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show a loading indicator while checking preferences
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
