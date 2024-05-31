import 'package:flutter/foundation.dart';
import 'package:flutter_5iw3/core/models/cart_line.dart';
import 'package:flutter_5iw3/core/models/product.dart';
import 'package:flutter_5iw3/core/services/cart_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<CartInitialized>((event, emit) async {
      emit(state.copyWith(status: CartStatus.loading));
      await CartServices.init();
      add(CartDataLoaded());
    });

    on<CartDataLoaded>((event, emit) async {
      emit(state.copyWith(status: CartStatus.loading));
      final items = await CartServices.getCartItems();
      emit(state.copyWith(status: CartStatus.success, items: items));
    });

    on<CartItemAdded>((event, emit) async {
      emit(state.copyWith(status: CartStatus.loading));
      final items = await CartServices.addToCart(product: event.product, quantity: event.quantity);
      emit(state.copyWith(status: CartStatus.success, items: items));
    });

    on<CartItemUpdated>((event, emit) async {
      emit(state.copyWith(status: CartStatus.loading));
      final items = await CartServices.updateCartLine(product: event.product, quantity: event.quantity);
      emit(state.copyWith(status: CartStatus.success, items: items));
    });

    on<CartItemRemoved>((event, emit) async {
      emit(state.copyWith(status: CartStatus.loading));
      final items = await CartServices.removeFromCart(product: event.product);
      emit(state.copyWith(status: CartStatus.success, items: items));
    });

    on<CartCleared>((event, emit) async {
      emit(state.copyWith(status: CartStatus.loading));
      await CartServices.clearCart();
      emit(state.copyWith(status: CartStatus.success, items: []));
    });
  }
}
