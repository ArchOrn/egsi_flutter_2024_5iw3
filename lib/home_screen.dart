import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.airplanemode_on,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'My Title',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: _backgroundColor,
      body: Center(
        child: Square(
          onTap: () {
            setState(() {
              _backgroundColor = _backgroundColor == Colors.white ? Colors.black : Colors.white;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: Icon(
              Icons.favorite,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Today',
            icon: Icon(
              Icons.calendar_today,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Square extends StatelessWidget {
  final VoidCallback onTap;

  const Square({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      ),
    );
  }
}
