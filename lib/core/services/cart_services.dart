import 'dart:convert';

import 'package:flinq/flinq.dart';
import 'package:flutter_5iw3/core/models/cart_line.dart';
import 'package:flutter_5iw3/core/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartServices {
  static const _cartKey = 'kCart';

  static final List<CartLine> _cartLines = [];

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final cartItems = prefs.getStringList(_cartKey) ?? [];
    _cartLines.clear();
    _cartLines.addAll(cartItems.map((item) => CartLine.fromJson(json.decode(item))));
  }

  static Future<List<CartLine>> getCartItems() async {
    return _cartLines;
  }

  static Future<List<CartLine>> addToCart({required Product product, int quantity = 1}) async {
    final cartLine = _cartLines.firstOrNullWhere((line) => line.product.id == product.id);
    if (cartLine != null) {
      return updateCartLine(product: product, quantity: cartLine.quantity + quantity);
    }

    _cartLines.add(CartLine(product: product, quantity: quantity));
    await _saveCartItems();
    return _cartLines;
  }

  static Future<List<CartLine>> updateCartLine({required Product product, int quantity = 1}) async {
    final index = _cartLines.indexWhere((line) => line.product.id == product.id);
    _cartLines.replaceRange(index, index + 1, [CartLine(product: product, quantity: quantity)]);
    await _saveCartItems();
    return _cartLines;
  }

  static Future<List<CartLine>> removeFromCart({required Product product}) async {
    _cartLines.removeWhere((line) => line.product.id == product.id);
    await _saveCartItems();
    return _cartLines;
  }

  static Future<void> clearCart() async {
    _cartLines.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }

  static Future<void> _saveCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_cartKey, _cartLines.map((line) => json.encode(line.toJson())).toList());
  }
}