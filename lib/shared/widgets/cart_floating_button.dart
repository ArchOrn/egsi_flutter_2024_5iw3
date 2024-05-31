import 'package:flutter/material.dart';
import 'package:flutter_5iw3/cart/blocs/cart_bloc.dart';
import 'package:flutter_5iw3/cart/cart_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartFloatingButton extends StatelessWidget {
  static const heroTag = 'cart_floating_button';

  const CartFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Stack(
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () => CartScreen.navigateTo(context),
            child: const Icon(Icons.shopping_cart),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      '${state.count}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
