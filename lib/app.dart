import 'package:flutter/material.dart';
import 'package:flutter_5iw3/home/home_screen.dart';
import 'package:flutter_5iw3/product/product_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
      },
      onGenerateRoute: (settings) {
        final args = settings.arguments;
        switch(settings.name) {
          case ProductScreen.routeName:
            return MaterialPageRoute(builder: (context) => ProductScreen(id: args as int));
        }
      },
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.amber,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
