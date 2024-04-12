import 'package:flutter/material.dart';
import 'package:flutter_5iw3/red_square.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('First Name $index Last Name $index'),
              subtitle: Text('$index, rue du Faubourg St Antoine'),
              leading: const Icon(Icons.person),
              onTap: () {},
            );
          },
          itemCount: 100000,
        ),
      ),
    );
  }
}
