import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CustomTheme(
        child: Home(),
      ),
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
          style: CustomTheme.of(context).textStyle1,
        ),
      ),
    );
  }
}

class CustomTheme extends InheritedWidget {
  final TextStyle textStyle1 = const TextStyle(
    color: Colors.blue,
    fontSize: 25,
  );

  const CustomTheme({
    super.key,
    required super.child,
  });

  static CustomTheme of(BuildContext context) {
    final CustomTheme? result = context.dependOnInheritedWidgetOfExactType<CustomTheme>();
    assert(result != null, 'No CustomTheme found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CustomTheme old) {
    return true;
  }
}
