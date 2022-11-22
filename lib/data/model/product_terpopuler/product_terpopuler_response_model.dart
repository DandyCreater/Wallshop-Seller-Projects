// ignore_for_file: unnecessary_this

import 'package:wallshop_seller/domain/entity/product_terpopuler/product_terpopupler_entity.dart';

class ProductTerpopulerResponseModel {
  String? responseCode;
  OKContentPopuler? oKContentPopuler;

  ProductTerpopulerResponseModel({this.responseCode, this.oKContentPopuler});

  ProductTerpopulerResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    oKContentPopuler = json['OKContentPopuler'] != null
        ? new OKContentPopuler.fromJson(json['OKContentPopuler'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    if (this.oKContentPopuler != null) {
      data['OKContentPopuler'] = this.oKContentPopuler!.toJson();
    }
    return data;
  }

  ProductTerpopulerEntity toEntity() {
    return ProductTerpopulerEntity(
        responseCode: this.responseCode,
        oKContentPopuler: this.oKContentPopuler != null
            ? this.oKContentPopuler!.toEntity()
            : null);
  }
}

class OKContentPopuler {
  List<Items>? items;

  OKContentPopuler({this.items});

  OKContentPopuler.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  OKContentPopulerEntity toEntity() {
    return OKContentPopulerEntity(
        items: this.items != null
            ? this.items!.map((e) => e.toEntity()).toList()
            : null);
  }
}

class Items {
  String? imageUrl;
  String? title;
  String? count;

  Items({this.imageUrl, this.title, this.count});

  Items.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['title'] = this.title;
    data['count'] = this.count;
    return data;
  }

  ItemsEntity toEntity() {
    return ItemsEntity(
        imageUrl: this.imageUrl, title: this.title, count: this.count);
  }
}
