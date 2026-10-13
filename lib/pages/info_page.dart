import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,

      appBar: AppBar(
        title: const Text(
          'Information',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black12,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AppName',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Text(
              'About AppName',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              'This is dummy info page. I am just writing some nonsense '
                  'to make this sentence long...ba ba booey, ga ga gooey',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}