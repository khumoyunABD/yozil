import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:yozil/core/core.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({super.key});

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  bool _isPhoneValid = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  // Validate phone number as user types
  void _validatePhoneNumber(String value) {
    // Uzbekistan phone numbers are typically 9 digits after the country code
    // Check if the number has exactly 9 digits
    setState(() {
      _isPhoneValid = value.length == 9 && RegExp(r'^[0-9]+$').hasMatch(value);
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If validation passes, save the form
      _formKey.currentState!.save();

      // Concatenate the country code with the phone number
      final fullPhoneNumber = '+998${_phoneController.text}';

      // Navigate to password creation screen with the phone number
      context.push(
        ScreenPath.passwordVerification,
        extra: fullPhoneNumber,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Match screenshot background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Telefon raqamingizni kiriting',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                // Phone number input with "+998" prefix
                SizedBox(
                  width: 340,
                  height: 60,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // The "+998" prefix
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 6,
                        ),
                        child: const Text(
                          '+998',
                          style: TextStyle(
                            fontSize: 24,
                            color:
                                Colors.white70, // Lighter color for dark theme
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),

                      // The underlined text field
                      Flexible(
                        child: TextFormField(
                          controller: _phoneController, // Add controller
                          style: const TextStyle(
                            fontSize: 24,
                            color: Color(0xFF666666),
                          ),
                          keyboardType: TextInputType.phone,
                          maxLength: 9,
                          buildCounter: (context,
                                  {required currentLength,
                                  required isFocused,
                                  maxLength}) =>
                              null, // Hide the counter
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: _validatePhoneNumber,

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Telefon raqam kiriting';
                            }

                            if (value.length != 9) {
                              return 'Notogri telefon raqami kiritildi';
                            }
                            if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Faqat raqamlar kiritilishi mumkin';
                            }
                            return null;
                          },

                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors
                                    .white70, // Visible on dark background
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors
                                    .white70, // Visible on dark background
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors
                                    .white70, // Visible on dark background
                                width: 1.5,
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(
                                    0xFF7ECEF4), // Same blue as the button

                                width: 1.0,
                              ),
                            ),
                            errorStyle: TextStyle(
                              color: Color(
                                  0xFF7ECEF4), // Same blue as the button for consistency
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.only(bottom: 8),
                            hintText: '',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isPhoneValid
                        ? const Color(0xFF7ECEF4)
                        : const Color(0xFF7ECEF4).withValues(alpha: 0.5),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor:
                        const Color(0xFF7ECEF4).withValues(alpha: 0.5),
                    disabledForegroundColor:
                        Colors.white.withValues(alpha: 0.7),
                    padding: EdgeInsets.zero,
                    elevation: _isPhoneValid ? 3 : 0,
                    shadowColor: Colors.grey.withValues(alpha: 0.3),
                  ),
                  onPressed: _isPhoneValid ? _submitForm : null,
                  child: Container(
                    width: 340,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        14,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Davom etish',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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
    );
  }
}
