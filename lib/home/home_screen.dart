import 'package:flutter/material.dart';
import 'package:flutter_5iw3/calendar/calendar_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

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
              'Home screen',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _controller,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => CalendarScreen.navigateTo(context, username: _controller.text),
              child: const Text('Go!'),
            ),
          ],
        ),
      ),
    );
  }
}
