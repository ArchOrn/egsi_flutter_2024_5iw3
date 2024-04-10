import 'package:flutter/material.dart';

class RedSquare extends StatelessWidget {
  const RedSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
    );
  }
}
