import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wallshop_seller/domain/entity/product/product_entity.dart';
import 'package:wallshop_seller/domain/usecase/product_usecase/product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUseCase productUseCase;
  ProductBloc(this.productUseCase) : super(ProductInitial()) {
    on<FetchProduct>((event, emit) async {
      emit(ProductLoading());
      try {
        final result = await productUseCase.execute();
        result.fold((failure) {
          emit(ProductFailed(message: failure.message));
        }, (response) {
          emit(ProductSuccess(value: response.oKContentProduct));
        });
      } catch (e) {
        debugPrint("CATCH ERROR BLOC PRODUCT $e");
        emit(ProductFailed(message: "CATCH ERROR BLOC PRODUCT $e"));
      }
    });
  }
}
