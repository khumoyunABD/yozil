import 'package:flutter/material.dart';

class PhoneVerificationPage extends StatelessWidget {
  const PhoneVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // The "+998" prefix
                    const Text(
                      '+998',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF666666),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // The underlined text field
                    Expanded(
                      child: TextFormField(
                        style: const TextStyle(
                          fontSize: 24,
                          color: Color(0xFF666666),
                        ),
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.5,
                            ),
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
                  backgroundColor: const Color(0xFF7ECEF4),
                ),
                onPressed: () {},
                child: Container(
                  width: 340,
                  height: 60,
                  color: const Color(0xFF7ECEF4),
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
    );
  }
}
