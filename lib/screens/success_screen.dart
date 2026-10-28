import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import 'welcome_screen.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key, required this.name});

  final String name;

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  late final ConfettiController _confettiController;
  bool _redirecting = false;

  @override
  void initState() {
    super.initState();

    _confettiController = ConfettiController(
      duration: const Duration(seconds: 4),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      // Task C: reject empty or whitespace-only names.
      if (widget.name.trim().isEmpty) {
        _redirectToWelcome();
        return;
      }

      _confettiController.play();
    });
  }

  void _redirectToWelcome() {
    if (!mounted || _redirecting) return;

    _redirecting = true;

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<void>(builder: (_) => const WelcomeScreen()),
      (route) => false,
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Avoid displaying a blank-name success message during redirection.
    if (widget.name.trim().isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to PawPal'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.pets, size: 86, color: Color(0xFF6B4EFF)),
                    const SizedBox(height: 20),
                    Text(
                      'You’re in the pack, ${widget.name.trim()}!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Your PawPal signup demo is complete. '
                      'Get ready for more tail-wagging adventures!',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),
                    FilledButton.icon(
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      icon: const Icon(Icons.home_outlined),
                      label: const Text('Back to welcome'),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                emissionFrequency: 0.05,
                numberOfParticles: 18,
                maxBlastForce: 25,
                minBlastForce: 8,
                gravity: 0.15,
                shouldLoop: false,
                colors: const [
                  Color(0xFF6B4EFF),
                  Color(0xFF19A88A),
                  Colors.pink,
                  Colors.amber,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
