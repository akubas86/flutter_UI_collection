import 'package:flutter/material.dart';
import 'info_page.dart';

class FloatingActionPage extends StatefulWidget {
  const FloatingActionPage({super.key});

  @override
  State<FloatingActionPage> createState() =>
      _FloatingActionPageState();
}

class _FloatingActionPageState extends State<FloatingActionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool toggle = true;

  Alignment alignment1 = const Alignment(0.0, 0.0);
  Alignment alignment2 = const Alignment(0.0, 0.0);
  Alignment alignment3 = const Alignment(0.0, 0.0);

  double size1 = 50.0;
  double size2 = 50.0;
  double size3 = 50.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      reverseDuration: const Duration(milliseconds: 275),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      toggle = !toggle;

      if (toggle) {
        _controller.reverse();

        alignment1 = const Alignment(0.0, 0.0);
        alignment2 = const Alignment(0.0, 0.0);
        alignment3 = const Alignment(0.0, 0.0);

        size1 = size2 = size3 = 20.0;
      } else {
        _controller.forward();

        alignment1 = const Alignment(-0.7, -0.4);
        alignment2 = const Alignment(0.0, -0.8);
        alignment3 = const Alignment(0.7, -0.4);

        size1 = size2 = size3 = 50.0;
      }
    });
  }

  Widget _menuItem({
    required Alignment alignment,
    required double size,
    required IconData icon,
    VoidCallback? onPressed,
  }) {
    return AnimatedAlign(
      duration: toggle
          ? const Duration(milliseconds: 275)
          : const Duration(milliseconds: 875),
      alignment: alignment,
      curve: toggle ? Curves.easeIn : Curves.elasticOut,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 275),
        curve: toggle ? Curves.easeIn : Curves.easeOut,
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(40),
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: Colors.blueAccent),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text('Floating Action Demo'),
        backgroundColor: Colors.black12,
      ),
      body: Center(
        child: SizedBox(
          height: 275,
          width: 275,
          child: Stack(
            children: [
              _menuItem(
                alignment: alignment1,
                size: size1,
                icon: Icons.shopping_cart_sharp,
                onPressed: () {},
              ),
              _menuItem(
                alignment: alignment2,
                size: size2,
                icon: Icons.business_sharp,
                onPressed: () {},
              ),
              _menuItem(
                alignment: alignment3,
                size: size3,
                icon: Icons.info_sharp,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const InfoPage(),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: _animation.value * 3.14159 * (3 / 4),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 375),
                    curve: Curves.easeOut,
                    height: toggle ? 64 : 54,
                    width: toggle ? 64 : 54,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A90E2),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: _toggleMenu,
                        splashColor: Colors.lightBlueAccent,
                        splashRadius: 41,
                        icon: Image.asset(
                          'assets/icons/plus.png',
                          height: 27,
                        ),
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
