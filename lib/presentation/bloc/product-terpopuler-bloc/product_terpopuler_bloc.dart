import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wallshop_seller/data/model/product_terpopuler/product_terpopuler_response_model.dart';
import 'package:wallshop_seller/domain/entity/product_terpopuler/product_terpopupler_entity.dart';
import 'package:wallshop_seller/domain/usecase/product_terpopuler_usecase/product_terpopuler_usecase.dart';

part 'product_terpopuler_event.dart';
part 'product_terpopuler_state.dart';

class ProductTerpopulerBloc
    extends Bloc<ProductTerpopulerEvent, ProductTerpopulerState> {
  final ProductTerpopulerUseCase productTerpopulerUseCase;
  ProductTerpopulerBloc(this.productTerpopulerUseCase)
      : super(ProductTerpopulerInitial()) {
    on<FetchProductPopuler>((event, emit) async {
      emit(ProductTerpopulerLoading());

      try {
        final result = await productTerpopulerUseCase.execute();

        result.fold((failure) {
          emit(ProductTerpopulerFailed(message: failure.message));
        }, (response) {
          emit(ProductTerpopulerSuccess(value: response.oKContentPopuler));
        });
      } catch (e) {
        debugPrint("BLOC PRODUCT TERPOPULER $e");
        emit(ProductTerpopulerFailed(message: "BLOC PRODUCT TERPOPULER $e"));
      }
    });
  }
}
