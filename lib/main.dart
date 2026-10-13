import 'package:flutter/material.dart';
import 'pages/floating_action_button.dart';
import 'pages/animated_background_page.dart';
import 'pages/fade_intro.dart';
import 'widget/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: puasLiteTheme,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Gallery'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.0,
        children: [
          _demoButton(
            context,
            title: 'Floating Action',
            icon: Icons.add_circle_outline,
            page: const FloatingActionPage(),
          ),
          _demoButton(
            context,
            title: 'Fade Intro',
            icon: Icons.animation,
            page: const FadeIntroScreen(),
          ),
          _demoButton(
            context,
            title: 'Animated Background',
            icon: Icons.blur_on,
            page: const AnimatedBackgroundPage(),
          ),
        ],
      ),
    );
  }

  Widget _demoButton(
      BuildContext context, {
        required String title,
        required IconData icon,
        required Widget page,
      }) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 42, color: Colors.blueAccent),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
