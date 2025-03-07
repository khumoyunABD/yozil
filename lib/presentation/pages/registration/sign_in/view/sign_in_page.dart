import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yozil/core/core.dart';
import 'package:yozil/presentation/bloc/auth/auth_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //bool _isLoading = false;
  bool _isChecking = true;

  @override
  void initState() {
    super.initState();
    // Check authentication status when the page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthBloc>().add(const AuthEvent.checkStatus());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // Handle state changes
        state.maybeWhen(
          authenticated: (user) {
            // If authenticated, navigate to home screen
            context.go(ScreenPath.initialCheck);
          },
          unauthenticated: () {
            // If not authenticated, stay on this page but stop loading
            setState(() {
              _isChecking = false;
            });
          },
          error: (message) {
            // Handle error state
            setState(() {
              _isChecking = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: $message'),
                backgroundColor: Colors.red,
              ),
            );
          },
          loading: () {
            setState(() {
              _isChecking = true;
            });
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        // Debug output to see what state we're in
        log('Current auth state: $state');
        // Show loading indicator while checking auth status
        if (_isChecking) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Show the actual sign in page once auth check is complete
        return Scaffold(
          appBar: AppBar(),
          //backgroundColor: const Color(0xFFF0F0F0),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),

                // Phone number input
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black26,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(
                        14,
                      ),
                    ),
                    //padding: EdgeInsets.symmetric(horizontal: 32),
                    width: 380,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Telefon nomer',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    context.push(
                      ScreenPath.verifyPhone,
                    );
                  },
                ),

                const SizedBox(height: 16),

                // "yoki" text (or)
                Text(
                  'yoki',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 16),

                // Google button

                // Google button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: InkWell(
                    onTap: () {
                      // Handle Google sign in
                      // You can add Google sign in functionality here
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF7ECEF4),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'G',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 110,
                            ),
                            Text(
                              'Google',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Terms and conditions text
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 24.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                      children: [
                        TextSpan(
                          text: 'Ushbu iloyadan foydalangan holda, siz ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text:
                              'Shaxsiy ma\'lumotlarni qayta ishlashga rozlik bildirasiz',
                          style: TextStyle(color: Colors.blue),
                        ),
                        TextSpan(
                          text: ' va ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: 'Foydalanuvchi shartnomasi',
                          style: TextStyle(color: Colors.blue),
                        ),
                        TextSpan(
                          text: ' va ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: 'Maxfiylik siyosati',
                          style: TextStyle(color: Colors.blue),
                        ),
                        TextSpan(
                          text:
                              ' shartlariga rioya qilishga rozlik bildirasiz.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
