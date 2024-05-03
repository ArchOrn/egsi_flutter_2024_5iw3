import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  static Future<void> navigateTo(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const CalendarScreen();
      },
    ));
  }

  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Calendar screen',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('<- Back'),
            ),
          ],
        ),
      ),
    );
  }
}
