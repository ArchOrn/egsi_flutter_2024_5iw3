import 'dart:convert';
import 'dart:developer';

import 'package:flutter_5iw3/core/models/post.dart';
import 'package:flutter_5iw3/core/models/user.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      await Future.delayed(const Duration(seconds: 1));
      if (response.statusCode < 200 || response.statusCode >= 400) {
        throw Error();
      }

      final data = json.decode(response.body) as List<dynamic>;
      return data.map((e) => Post.fromJson(e)).toList();
    } catch (error) {
      log('An error occurred while retrieving posts.', error: error);
      rethrow;
    }
  }

  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      await Future.delayed(const Duration(seconds: 1));
      if (response.statusCode < 200 || response.statusCode >= 400) {
        throw Error();
      }

      final data = json.decode(response.body) as List<dynamic>;
      return data.map((e) => User.fromJson(e)).toList();
    } catch (error) {
      log('An error occurred while retrieving users.', error: error);
      rethrow;
    }
  }
}
