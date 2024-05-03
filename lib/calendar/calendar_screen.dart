import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  static void navigateTo(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const CalendarScreen();
      },
    ));
  }

  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Calendar screen',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            // const SizedBox(height: 10),
            // ElevatedButton(
            //   onPressed: () {
            //     // TODO
            //   },
            //   child: const Text('Go!'),
            // ),
          ],
        ),
      ),
    );
  }
}
