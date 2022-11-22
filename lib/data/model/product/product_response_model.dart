// ignore_for_file: unnecessary_this

import 'package:wallshop_seller/domain/entity/product/product_entity.dart';

class ProductResponseModel {
  String? responseStatus;
  OKContentProduct? oKContentProduct;

  ProductResponseModel({this.responseStatus, this.oKContentProduct});

  ProductResponseModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['responseStatus'];
    oKContentProduct = json['OKContentProduct'] != null
        ? new OKContentProduct.fromJson(json['OKContentProduct'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseStatus'] = this.responseStatus;
    if (this.oKContentProduct != null) {
      data['OKContentProduct'] = this.oKContentProduct!.toJson();
    }
    return data;
  }

  ProductEntity toEntity() {
    return ProductEntity(
        responseStatus: this.responseStatus,
        oKContentProduct: this.oKContentProduct != null
            ? this.oKContentProduct!.toEntity()
            : null);
  }
}

class OKContentProduct {
  List<Product>? product;

  OKContentProduct({this.product});

  OKContentProduct.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  OKContentProductEntity toEntity() {
    return OKContentProductEntity(
        product: this.product != null
            ? this.product!.map((e) => e.toEntity()).toList()
            : null);
  }
}

class Product {
  String? imageUrl;
  String? title;
  String? price;
  String? stok;
  String? status;

  Product({this.imageUrl, this.title, this.price, this.stok, this.status});

  Product.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
    price = json['price'];
    stok = json['stok'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['title'] = this.title;
    data['price'] = this.price;
    data['stok'] = this.stok;
    data['status'] = this.status;
    return data;
  }

  ProductList toEntity() {
    return ProductList(
        imageUrl: this.imageUrl,
        title: this.title,
        price: this.price,
        stok: this.stok,
        status: this.status);
  }
}
