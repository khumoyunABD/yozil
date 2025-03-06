import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yozil/core/core.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //backgroundColor: const Color(0xFFF0F0F0),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo and title
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       width: 80,
            //       height: 80,
            //       decoration: BoxDecoration(
            //         color: const Color(0xFFD5C1E0),
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: Center(
            //         child: Text(
            //           'Y',
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 56,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(width: 16),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: const [
            //         Text(
            //           'Yozil',
            //           style: TextStyle(
            //             fontSize: 28,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.white,
            //           ),
            //         ),
            //         Text(
            //           'CRM-tizimi va onlayn yozuv',
            //           style: TextStyle(
            //             fontSize: 16,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),

            const SizedBox(height: 60),

            // Phone number input
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black26,
              ),

              // decoration: InputDecoration(
              //   hintText: 'Telefon nomer',
              //   hintStyle: TextStyle(color: Colors.grey),
              //   contentPadding:
              //       EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              //   border: InputBorder.none,
              // ),
              // textAlign: TextAlign.center,

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
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
                      SizedBox(),
                    ],
                  ),
                ),
              ),
            ),

            // Terms and conditions text
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
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
                      text: ' shartlariga rioya qilishga rozlik bildirasiz.',
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
  }
}
