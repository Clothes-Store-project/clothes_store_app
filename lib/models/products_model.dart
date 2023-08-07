class ProductsModel {
  List<ProductModel>? response;

  ProductsModel({this.response});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <ProductModel>[];
      json['response'].forEach((v) {
        response!.add(new ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductModel {
  String? sId;
  String? name;
  List<String>? imageSrc;
  Desc? desc;
  int? quantity;
  String? sKU;
  String? categoryId;
  int? priceBefore;
  int? priceAfter;
  Sizes? sizes;
  String? subCategory;
  String? typeOfProduct;
  int? iV;

  ProductModel(
      {this.sId,
        this.name,
        this.imageSrc,
        this.desc,
        this.quantity,
        this.sKU,
        this.categoryId,
        this.priceBefore,
        this.priceAfter,
        this.sizes,
        this.subCategory,
        this.typeOfProduct,
        this.iV});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    imageSrc = json['imageSrc'].cast<String>();
    desc = json['desc'] != null ? new Desc.fromJson(json['desc']) : null;
    quantity = json['quantity'];
    sKU = json['SKU'];
    categoryId = json['category_id'];
    priceBefore = json['price_before'];
    priceAfter = json['price_after'];
    sizes = json['sizes'] != null ? new Sizes.fromJson(json['sizes']) : null;
    subCategory = json['subCategory'];
    typeOfProduct = json['typeOfProduct'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['imageSrc'] = this.imageSrc;
    if (this.desc != null) {
      data['desc'] = this.desc!.toJson();
    }
    data['quantity'] = this.quantity;
    data['SKU'] = this.sKU;
    data['category_id'] = this.categoryId;
    data['price_before'] = this.priceBefore;
    data['price_after'] = this.priceAfter;
    if (this.sizes != null) {
      data['sizes'] = this.sizes!.toJson();
    }
    data['subCategory'] = this.subCategory;
    data['typeOfProduct'] = this.typeOfProduct;
    data['__v'] = this.iV;
    return data;
  }
}

class Desc {
  String? color;
  String? type;
  Brand? brand;
  String? description;

  Desc({this.color, this.type, this.brand, this.description});

  Desc.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    type = json['type'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['type'] = this.type;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    data['description'] = this.description;
    return data;
  }
}

class Brand {
  String? name;
  String? logo;

  Brand({this.name, this.logo});

  Brand.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['logo'] = this.logo;
    return data;
  }
}

class Sizes {
  int? s;
  int? m;
  int? l;
  int? xl;
  int? xxl;

  Sizes({this.s, this.m, this.l, this.xl, this.xxl});

  Sizes.fromJson(Map<String, dynamic> json) {
    s = json['s'];
    m = json['m'];
    l = json['l'];
    xl = json['xl'];
    xxl = json['xxl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s'] = this.s;
    data['m'] = this.m;
    data['l'] = this.l;
    data['xl'] = this.xl;
    data['xxl'] = this.xxl;
    return data;
  }
}
