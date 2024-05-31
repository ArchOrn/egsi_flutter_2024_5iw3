part of 'cart_bloc.dart';

enum CartStatus { initial, loading, success, error }

class CartState {
  final CartStatus status;
  final List<CartLine> items;
  final String? errorMessage;

  CartState({
    this.status = CartStatus.initial,
    this.items = const [],
    this.errorMessage,
  });

  int get count => items.fold(0, (acc, line) => acc + line.quantity);

  CartState copyWith({
    CartStatus? status,
    List<CartLine>? items,
    String? errorMessage,
  }) {
    return CartState(
      status: status ?? this.status,
      items: items ?? this.items,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
