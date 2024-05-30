import 'package:flutter/material.dart';
import 'package:flutter_5iw3/core/models/product.dart';
import 'package:flutter_5iw3/product/blocs/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static navigateTo(BuildContext context, {required int id}) {
    Navigator.of(context).pushNamed(routeName, arguments: id);
  }

  final int id;

  const ProductScreen({super.key, required this.id});

  Widget _buildRating(BuildContext context, {required double rating}) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color: index < rating ? Colors.blue : Colors.grey,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(ProductDataLoaded(id: id)),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          final product = state.product;
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(product?.title ?? ''),
              ),
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  if (state.status == ProductStatus.loading)
                    const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  if (state.status == ProductStatus.success && product != null)
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 200,
                            child: Image.network(
                              product.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${product.price} €',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(product.description),
                                const SizedBox(height: 10),
                                _buildRating(context, rating: product.rating),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
