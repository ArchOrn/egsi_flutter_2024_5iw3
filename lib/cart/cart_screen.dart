import 'package:flutter/material.dart';
import 'package:flutter_5iw3/cart/blocs/cart_bloc.dart';
import 'package:flutter_5iw3/shared/widgets/cart_floating_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static navigateTo(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final item = state.items[index];
                return Dismissible(
                  key: Key(item.product.id.toString()),
                  onDismissed: (direction) => context.read<CartBloc>().add(CartItemRemoved(product: item.product)),
                  child: ListTile(
                    leading: Image.network(item.product.imageUrl),
                    title: Text(item.product.title),
                    subtitle: Text(
                      item.product.description,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(item.quantity > 1 ? 'x${item.quantity}' : ''),
                  ),
                );
              },
              itemCount: state.items.length,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: CartFloatingButton.heroTag,
          backgroundColor: Colors.red.shade100,
          onPressed: () {
            context.read<CartBloc>().add(CartCleared());
          },
          child: const Icon(Icons.remove_shopping_cart),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
