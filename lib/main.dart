import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.amber,
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          'Hello',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
