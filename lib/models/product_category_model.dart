class ProductCategoryModel {
  List<ProductCategory>? productCategory;

  ProductCategoryModel({this.productCategory});

  ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      productCategory = <ProductCategory>[];
      json['response'].forEach((v) {
        productCategory!.add(ProductCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productCategory != null) {
      data['response'] = productCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductCategory {
  String? sId;
  String? name;
  String? desc;
  int? iV;

  ProductCategory({this.sId, this.name, this.desc, this.iV});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    desc = json['desc'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['desc'] = desc;
    data['__v'] = iV;
    return data;
  }
}