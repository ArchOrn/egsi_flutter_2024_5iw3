import 'package:flutter/material.dart';
import 'package:flutter_5iw3/core/models/post.dart';
import 'package:flutter_5iw3/core/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> _posts = [];
  bool _loading = false;
  Error? _error;

  @override
  void initState() {
    super.initState();

    setState(() {
      _loading = true;
    });

    ApiServices.getPosts().then((data) {
      _posts = data;
    }).catchError((error) {
      _error = error;
    }).whenComplete(() {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (_error != null
              ? Center(
                  child: Text(
                    _error.toString(),
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    final post = _posts[index];
                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    );
                  },
                  itemCount: _posts.length,
                )),
    );
  }
}
