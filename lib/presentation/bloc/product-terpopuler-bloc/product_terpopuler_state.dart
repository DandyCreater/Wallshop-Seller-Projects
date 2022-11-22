part of 'product_terpopuler_bloc.dart';

abstract class ProductTerpopulerState extends Equatable {
  const ProductTerpopulerState();

  @override
  List<Object> get props => [];
}

class ProductTerpopulerInitial extends ProductTerpopulerState {}

class ProductTerpopulerLoading extends ProductTerpopulerState {}

class ProductTerpopulerSuccess extends ProductTerpopulerState {
  final OKContentPopulerEntity? value;

  const ProductTerpopulerSuccess({required this.value});

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class ProductTerpopulerFailed extends ProductTerpopulerState {
  final String? message;

  const ProductTerpopulerFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
