import 'package:flutter/material.dart';

class FadeIntroScreen extends StatefulWidget {
  const FadeIntroScreen({super.key});

  @override
  State<FadeIntroScreen> createState() =>
      _FadeIntroScreenState();
}

class _FadeIntroScreenState extends State<FadeIntroScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  Future<void> _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;

    setState(() {
      _opacity = 1.0;
    });

    // Keep the intro visible for three seconds.
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    // Fade out the intro content.
    setState(() {
      _opacity = 0.0;
    });

    await Future.delayed(const Duration(milliseconds: 1500));
    if (!mounted) return;

    // Return to the previous page, usually the gallery.
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        child: const Center(
          child: Text(
            'Welcome',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
