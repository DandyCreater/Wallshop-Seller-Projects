import 'package:dartz/dartz.dart';
import 'package:wallshop_seller/data/utility/helper/failure.dart';
import 'package:wallshop_seller/domain/entity/product/product_entity.dart';
import 'package:wallshop_seller/domain/repository/domain_repository.dart';

class ProductUseCase {
  final DomainRepository repository;

  const ProductUseCase(this.repository);

  Future<Either<ResponseFailure, ProductEntity>> execute() async {
    return repository.getProduct();
  }
}
