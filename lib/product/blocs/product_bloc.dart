import 'package:flutter/foundation.dart';
import 'package:flutter_5iw3/core/exceptions/api_exception.dart';
import 'package:flutter_5iw3/core/models/product.dart';
import 'package:flutter_5iw3/core/services/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState()) {
    on<ProductDataLoaded>((event, emit) async {
      emit(state.copyWith(status: ProductStatus.loading));

      try {
        final product = await ApiServices.getProduct(id: event.id);
        emit(state.copyWith(status: ProductStatus.success, product: product));
      } on ApiException catch (error) {
        emit(state.copyWith(status: ProductStatus.error, errorMessage: error.message));
      } catch (error) {
        emit(state.copyWith(status: ProductStatus.error, errorMessage: 'Unhandled error'));
      }
    });
  }
}
