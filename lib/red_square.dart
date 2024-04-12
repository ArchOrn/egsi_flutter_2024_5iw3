import 'package:flutter/material.dart';

class RedSquare extends StatelessWidget {
  const RedSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      color: Colors.red,
    );
  }
}
