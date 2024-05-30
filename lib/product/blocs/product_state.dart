part of 'product_bloc.dart';

enum ProductStatus { initial, loading, success, error }

class ProductState {
  final ProductStatus status;
  final Product? product;
  final String? errorMessage;

  ProductState({
    this.status = ProductStatus.initial,
    this.product,
    this.errorMessage,
  });

  ProductState copyWith({
    ProductStatus? status,
    Product? product,
    String? errorMessage,
  }) {
    return ProductState(
      status: status ?? this.status,
      product: product ?? this.product,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
