import 'package:flutter/material.dart';

void main() => runApp(const WelcomeApp());

class WelcomeApp extends StatelessWidget {
  const WelcomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditate',
      theme: ThemeData(useMaterial3: true, scaffoldBackgroundColor: kTeal),
      home: const WelcomePage(),
    );
  }
}

const Color kTeal = Color(0xFF039EA2);

const Color kTealDark = Color(0xFF03A4A8);
const Color kLightTeal = Color(0xFFCDFDFE);

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: kTeal,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 110),
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.25),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(
                  Icons.self_improvement,
                  color: Colors.white,
                  size: 56,
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Meditate With Us!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 46),
              _SignInButton(
                backgroundColor: Colors.white,
                icon: Icons.apple,
                label: 'Sign in with Apple',
                textColor: Colors.black,
              ),
              const SizedBox(height: 14),
              _SignInButton(
                backgroundColor: kLightTeal,
                icon: Icons.email,
                label: 'Continue with Email or Phone',
                textColor: Colors.black,
              ),
              const SizedBox(height: 14),
              _SignInButton(
                backgroundColor: Colors.white,
                google: true,
                label: 'Continue With Google',
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({
    required this.backgroundColor,
    required this.label,
    required this.textColor,
    this.icon,
    this.google = false,
  });

  final Color backgroundColor;
  final String label;
  final Color textColor;
  final IconData? icon;
  final bool google;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 26),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (google)
              _GoogleMark()
            else
              Icon(icon ?? Icons.circle, size: 22),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GoogleMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: kTeal,
        shape: BoxShape.circle,
      ),
      child: const Text(
        'G',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}