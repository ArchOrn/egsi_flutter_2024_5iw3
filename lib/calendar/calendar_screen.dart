import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  static const String routeName = '/calendar';

  static Future<void> navigateTo(BuildContext context, {required String username}) {
    return Navigator.of(context).pushNamed(routeName, arguments: username);
  }

  final String username;

  const CalendarScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Calendar of $username',
              style: const TextStyle(
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
