import 'package:dartz/dartz.dart';
import 'package:wallshop_seller/data/utility/helper/failure.dart';
import 'package:wallshop_seller/domain/entity/product_terpopuler/product_terpopupler_entity.dart';
import 'package:wallshop_seller/domain/repository/domain_repository.dart';

class ProductTerpopulerUseCase {
  final DomainRepository repository;

  const ProductTerpopulerUseCase(this.repository);

  Future<Either<ResponseFailure, ProductTerpopulerEntity>> execute() async {
    return repository.getItemPopuler();
  }
}
