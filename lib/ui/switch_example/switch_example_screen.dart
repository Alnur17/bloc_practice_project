import 'package:flutter/material.dart';

class SwitchExampleScreen extends StatelessWidget {
  const SwitchExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Switch Example')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notifications'),
                Switch(value: true, onChanged: (value) {}),
              ],
            ),
            SizedBox(height: 20),
            Container(height: 200, color: Colors.red.withOpacity(0.5)),
            SizedBox(height: 20),
            Slider(value: 0.4, onChanged: (value) {}),
          ],
        ),
      ),
    );
  }
}
