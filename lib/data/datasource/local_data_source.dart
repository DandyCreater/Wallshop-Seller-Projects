import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallshop_seller/data/model/product/product_response_model.dart';
import 'package:wallshop_seller/data/model/product_terpopuler/product_terpopuler_response_model.dart';

abstract class LocalDataSource {
  Future getItemProductPopuler();
  Future getProduct();
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future getItemProductPopuler() async {
    try {
      final result =
          await rootBundle.loadString('assets/json/product_populer.json');
      var response =
          ProductTerpopulerResponseModel.fromJson(jsonDecode(result));

      return response;
    } catch (e) {
      debugPrint("Error Local Data Source Get Item Pro: $e");
      return e;
    }
  }

  @override
  Future getProduct() async {
    try {
      final result = await rootBundle.loadString('assets/json/product.json');
      var response = ProductResponseModel.fromJson(jsonDecode(result));

      return response;
    } catch (e) {
      debugPrint("Error Local Data Source Get Product : $e");
      return e;
    }
  }
}
