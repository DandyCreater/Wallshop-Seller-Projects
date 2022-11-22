import 'package:dartz/dartz.dart';
import 'package:wallshop_seller/data/utility/helper/failure.dart';
import 'package:wallshop_seller/domain/entity/product/product_entity.dart';
import 'package:wallshop_seller/domain/entity/product_terpopuler/product_terpopupler_entity.dart';

abstract class DomainRepository {
  Future<Either<ResponseFailure, ProductTerpopulerEntity>> getItemPopuler();
  Future<Either<ResponseFailure, ProductEntity>> getProduct();
}
