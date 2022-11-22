part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final OKContentProductEntity? value;

  const ProductSuccess({required this.value});

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class ProductFailed extends ProductState {
  final String? message;

  const ProductFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
