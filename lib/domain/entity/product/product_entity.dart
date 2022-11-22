class ProductEntity {
  String? responseStatus;
  OKContentProductEntity? oKContentProduct;

  ProductEntity({required this.responseStatus, required this.oKContentProduct});
}

class OKContentProductEntity {
  List<ProductList>? product;

  OKContentProductEntity({required this.product});

  OKContentProductEntity.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <ProductList>[];
      json['product'].forEach((v) {
        product!.add(new ProductList.fromJson(v));
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
}

class ProductList {
  String? imageUrl;
  String? title;
  String? price;
  String? stok;
  String? status;

  ProductList(
      {required this.imageUrl,
      required this.title,
      required this.price,
      required this.stok,
      required this.status});

  ProductList.fromJson(Map<String, dynamic> json) {
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
}
