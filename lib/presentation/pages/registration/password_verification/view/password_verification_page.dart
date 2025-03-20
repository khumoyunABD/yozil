import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yozil/core/core.dart';
import 'package:yozil/presentation/bloc/auth/auth_bloc.dart';

class PasswordVerificationPage extends StatefulWidget {
  const PasswordVerificationPage({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  State<PasswordVerificationPage> createState() =>
      _PasswordVerificationPageState();
}

class _PasswordVerificationPageState extends State<PasswordVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController =
      TextEditingController(); // Add name field for registration

  bool _isPasswordValid = false;
  bool _arePasswordsMatching = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;

  // @override
  // void initState() {
  //   super.initState();
  //   // Check if user is already authenticated
  //   context.read<AuthBloc>().add(const AuthEvent.checkStatus());
  // }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    setState(() {
      // Check password validity (min 6 chars, has number)
      _isPasswordValid =
          password.length >= 6 && RegExp(r'[0-9]').hasMatch(password);

      // Check if passwords match
      _arePasswordsMatching = password == confirmPassword &&
          password.isNotEmpty &&
          confirmPassword.isNotEmpty;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If validation passes, save the form
      _formKey.currentState!.save();

      setState(() {
        _isLoading = true;
      });

      // Get email from phone number or use phone as email
      final email =
          "${widget.phoneNumber}@example.com"; // You may want to modify this

      // Dispatch register event with phone number as the "email"
      context.read<AuthBloc>().add(
            AuthEvent.register(
              identifier: email,
              password: _passwordController.text,
              name: _nameController.text.isNotEmpty
                  ? _nameController.text
                  : "User ${widget.phoneNumber}",
            ),
          );

      // Navigate to home screen
      context.go(ScreenPath.serviceSelector);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: (_) {
            // User registered successfully, navigate to home screen
            context.go(ScreenPath.initialCheck);
          },
          error: (message) {
            setState(() {
              _isLoading = false;
            });
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message ?? 'Unexpected Error'),
                backgroundColor: Colors.red,
              ),
            );
          },
          loading: () {
            setState(() {
              _isLoading = true;
            });
          },
          orElse: () {
            setState(() {
              _isLoading = false;
            });
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Parol yarating',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Telefon raqami: ${widget.phoneNumber}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Name field
                  TextFormField(
                    controller: _nameController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Ismingiz',
                      labelStyle: TextStyle(color: Colors.white70),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Password field
                  TextFormField(
                    controller: _passwordController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    obscureText: !_isPasswordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {
                      _validateForm();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Parolni kiriting';
                      }
                      if (value.length < 6) {
                        return 'Parol kamida 6 ta belgidan iborat bo\'lishi kerak';
                      }
                      if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return 'Parol kamida bitta raqamni o\'z ichiga olishi kerak';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Parol',
                      labelStyle: const TextStyle(color: Colors.white70),
                      hintText: 'Kamida 6 ta belgi va 1 ta raqam',
                      hintStyle:
                          const TextStyle(color: Colors.white30, fontSize: 12),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7ECEF4)),
                      ),
                      errorStyle: const TextStyle(
                        color: Color(0xFF7ECEF4),
                        fontSize: 12,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Confirm password field
                  TextFormField(
                    controller: _confirmPasswordController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    obscureText: !_isConfirmPasswordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {
                      _validateForm();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Parolni tasdiqlang';
                      }
                      if (value != _passwordController.text) {
                        return 'Parollar mos kelmaydi';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Parolni tasdiqlang',
                      labelStyle: const TextStyle(color: Colors.white70),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7ECEF4)),
                      ),
                      errorStyle: const TextStyle(
                        color: Color(0xFF7ECEF4),
                        fontSize: 12,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Submit button

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: (_isPasswordValid &&
                              _arePasswordsMatching &&
                              !_isLoading)
                          ? const Color(0xFF7ECEF4)
                          : const Color(0xFF7ECEF4).withValues(alpha: 0.5),
                      foregroundColor: Colors.white,
                      disabledBackgroundColor:
                          const Color(0xFF7ECEF4).withValues(alpha: 0.5),
                      disabledForegroundColor:
                          Colors.white.withValues(alpha: 0.7),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: (_isPasswordValid &&
                              _arePasswordsMatching &&
                              !_isLoading)
                          ? 3
                          : 0,
                      shadowColor: Colors.black.withValues(alpha: 0.3),
                    ),
                    onPressed: (_isPasswordValid &&
                            _arePasswordsMatching &&
                            !_isLoading)
                        ? _submitForm
                        : null,
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              )
                            : const Text(
                                'Davom etish',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
