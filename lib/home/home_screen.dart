import 'package:flutter/material.dart';
import 'package:flutter_5iw3/core/services/api_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: ApiServices.getUsers(),
        builder: (context, snapshot) {
          final loading = snapshot.connectionState == ConnectionState.waiting;
          if (loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            );
          }

          return ListView.builder(
            itemBuilder: (context, index) {
              final user = snapshot.data![index];
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(user.name),
                subtitle: Text(user.address),
              );
            },
            itemCount: snapshot.hasData ? snapshot.data!.length : 0,
          );
        },
      ),
    );
  }
}
