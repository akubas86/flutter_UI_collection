import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import '../widget/app_theme.dart';

class AnimatedBackgroundPage extends StatefulWidget {
  const AnimatedBackgroundPage({super.key});

  @override
  State<AnimatedBackgroundPage> createState() =>
      _AnimatedBackgroundPageState();
}

class _AnimatedBackgroundPageState
    extends State<AnimatedBackgroundPage>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text('Animated Background'),
        backgroundColor: Colors.black12,
      ),
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
          options: const ParticleOptions(
            spawnMaxRadius: 5,
            spawnMinSpeed: 15,
            particleCount: 500,
            spawnMaxSpeed: 40,
            spawnOpacity: 0.3,
            baseColor: Colors.blueAccent,
          ),
        ),
        child: const Center(
          child: Text(
            'Animated Background',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
