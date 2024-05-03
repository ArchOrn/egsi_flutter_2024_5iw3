import 'package:flutter/foundation.dart';
import 'package:flutter_5iw3/core/exceptions/api_exception.dart';
import 'package:flutter_5iw3/core/models/product.dart';
import 'package:flutter_5iw3/core/services/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeDataLoaded>((event, emit) async {
      emit(HomeDataLoading());

      try {
        final products = await ApiServices.getProducts();
        emit(HomeDataLoadingSuccess(products: products));
      } on ApiException catch (error) {
        emit(HomeDataLoadingError(errorMessage: error.message));
      } catch (error) {
        emit(HomeDataLoadingError(errorMessage: 'Unhandled error'));
      }
    });
  }
}
