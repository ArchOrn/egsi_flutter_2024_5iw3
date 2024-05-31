import 'package:flutter_5iw3/core/models/product.dart';

class CartLine {
  final Product product;
  final int quantity;

  CartLine({
    required this.product,
    this.quantity = 1,
  });

  factory CartLine.fromJson(Map<String, dynamic> json) {
    return CartLine(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }
}
