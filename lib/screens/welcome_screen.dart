
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF160F29),
              Color(0xFF352052),
              Color(0xFF10101D),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 32,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.sizeOf(context).height - 100,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '🐾',
                    style: TextStyle(fontSize: 82),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'PAWPAL',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFA94D),
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 6,
                    ),
                  ),

                  const SizedBox(height: 18),

                  SizedBox(
                    height: 110,
                    child: Center(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'The Haunted\nSignup Mansion',
                            textAlign: TextAlign.center,
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              height: 1.25,
                            ),
                            speed: const Duration(
                              milliseconds: 85,
                            ),
                          ),
                        ],
                        totalRepeatCount: 1,
                        isRepeatingAnimation: false,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Where every paw has a spooky story.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFD8CBE9),
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Join our haunted pet-loving community.\n'
                    'Your adventure begins beyond these doors.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 44),

                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignupScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF914D),
                        foregroundColor: const Color(0xFF20112F),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'Enter If You Dare  👻',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    '🎃  A little magic. A lot of paws.  🦇',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFC5B5D8),
                      fontSize: 13,
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
