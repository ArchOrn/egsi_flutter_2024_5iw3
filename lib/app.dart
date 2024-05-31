import 'package:flutter/material.dart';
import 'package:flutter_5iw3/cart/blocs/cart_bloc.dart';
import 'package:flutter_5iw3/cart/cart_screen.dart';
import 'package:flutter_5iw3/home/home_screen.dart';
import 'package:flutter_5iw3/product/product_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc()..add(CartInitialized()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const HomeScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
        },
        onGenerateRoute: (settings) {
          final args = settings.arguments;
          switch (settings.name) {
            case ProductScreen.routeName:
              return MaterialPageRoute(builder: (context) => ProductScreen(id: args as int));
          }

          return null;
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: Colors.amber,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
