class ProductTerpopulerEntity {
  String? responseCode;
  OKContentPopulerEntity? oKContentPopuler;

  ProductTerpopulerEntity(
      {required this.responseCode, required this.oKContentPopuler});
}

class OKContentPopulerEntity {
  List<ItemsEntity>? items;

  OKContentPopulerEntity({required this.items});

  OKContentPopulerEntity.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <ItemsEntity>[];
      json['items'].forEach((v) {
        items!.add(ItemsEntity.fromJson(v));
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
}

class ItemsEntity {
  String? imageUrl;
  String? title;
  String? count;

  ItemsEntity(
      {required this.imageUrl, required this.title, required this.count});

  ItemsEntity.fromJson(Map<String, dynamic> json) {
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
}
