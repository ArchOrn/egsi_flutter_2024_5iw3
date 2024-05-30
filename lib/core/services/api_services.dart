import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flinq/flinq.dart';
import 'package:flutter_5iw3/core/exceptions/api_exception.dart';
import 'package:flutter_5iw3/core/models/product.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));
      final data = json.decode(response.body)['products'] as List<dynamic>;
      return data.mapList((e) => Product.fromJson(e));
    } on SocketException catch (error) {
      log('Network error.', error: error);
      throw ApiException(message: 'Network error');
    } catch (error) {
      log('An error occurred while fetching products.', error: error);
      throw ApiException(message: 'Unknown error');
    }
  }

  static Future<Product> getProduct({required int id}) async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products/$id'));
      final data = json.decode(response.body) as Map<String, dynamic>;
      return Product.fromJson(data);
    } on SocketException catch (error) {
      log('Network error.', error: error);
      throw ApiException(message: 'Network error');
    } catch (error) {
      log('An error occurred while fetching product with id $id.', error: error);
      throw ApiException(message: 'Unknown error');
    }
  }
}