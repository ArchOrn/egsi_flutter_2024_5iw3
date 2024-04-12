import 'package:flutter/material.dart';
import 'package:flutter_5iw3/red_square.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const RedSquare(),
                ...List.generate(100, (index) {
                  return const Column(
                    children: [
                      SizedBox(height: 10),
                      RedSquare(),
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
