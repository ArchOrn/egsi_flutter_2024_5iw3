part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class CartInitialized extends CartEvent {}

final class CartDataLoaded extends CartEvent {}

final class CartItemAdded extends CartEvent {
  final Product product;
  final int quantity;

  CartItemAdded({required this.product, this.quantity = 1});
}

final class CartItemUpdated extends CartEvent {
  final Product product;
  final int quantity;

  CartItemUpdated({required this.product, required this.quantity});
}

final class CartItemRemoved extends CartEvent {
  final Product product;

  CartItemRemoved({required this.product});
}

final class CartCleared extends CartEvent {}
