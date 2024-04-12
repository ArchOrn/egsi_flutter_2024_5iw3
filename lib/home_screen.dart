import 'package:flutter/material.dart';
import 'package:flutter_5iw3/red_square.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 300,
            ),
            itemBuilder: (context, index) {
              return const RedSquare();
            },
            itemCount: 100000,
          )),
    );
  }
}
