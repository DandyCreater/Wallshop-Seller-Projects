import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:wallshop_seller/data/datasource/local_data_source.dart';
import 'package:wallshop_seller/data/model/product/product_response_model.dart';
import 'package:wallshop_seller/data/model/product_terpopuler/product_terpopuler_response_model.dart';
import 'package:wallshop_seller/data/utility/helper/failure.dart';
import 'package:wallshop_seller/domain/entity/product/product_entity.dart';
import 'package:wallshop_seller/domain/entity/product_terpopuler/product_terpopupler_entity.dart';
import 'package:wallshop_seller/domain/repository/domain_repository.dart';

class DataRepositoryImpl extends DomainRepository {
  final LocalDataSource localDataSource;

  DataRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<ResponseFailure, ProductTerpopulerEntity>>
      getItemPopuler() async {
    try {
      ProductTerpopulerResponseModel result =
          await localDataSource.getItemProductPopuler();
      if (result.responseCode == "OK") {
        return right(result.toEntity());
      } else {
        return left(ResponseFailure("Get Item Product Populer Error"));
      }
    } catch (e) {
      debugPrint("CATCH ITEM PRODUCT POPULER ERROR $e");
      return Left(ResponseFailure("CATCH ITEM PRODUCT POPULER ERROR $e"));
    }
  }

  @override
  Future<Either<ResponseFailure, ProductEntity>> getProduct() async {
    try {
      ProductResponseModel result = await localDataSource.getProduct();
      if (result.responseStatus == "OK") {
        return right(result.toEntity());
      } else {
        return left(ResponseFailure("Get Product Error"));
      }
    } catch (e) {
      debugPrint("CATCH PRODUCT ERROR $e");
      return Left(ResponseFailure("CATCH PRODUCT ERROR $e"));
    }
  }
}
