import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yozil/core/core.dart';
import 'package:yozil/presentation/presentation.dart';

class ServiceSelectorPage extends StatelessWidget {
  const ServiceSelectorPage({super.key});

  // Save the selected service
  Future<void> _saveSelectedService(
      BuildContext context, String service) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selected_service', service);
      if (context.mounted) {
        context.go(ScreenPath.home);
      }
    } catch (e) {
      log('Error saving preference: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(149, 97, 100, 101),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.8, 0.3],
            colors: [
              Color(0xFF0D0D0D),
              Color.fromARGB(255, 56, 39, 39),
              Color.fromARGB(255, 56, 39, 39),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    const Text(
                      '$appName siz yoqtirgan xizmatlarni',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'osonlik bilan topish imkonini beradi.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text('Menga quyidagi xizmatlar kerak:'),
                    const SizedBox(height: 36),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _saveSelectedService(context, 'ayol'),
                        child: const Text('Ayol'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _saveSelectedService(context, 'erkak'),
                        child: const Text('Erkak'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            _saveSelectedService(context, 'hammasi'),
                        child: const Text('Hammasi'),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
