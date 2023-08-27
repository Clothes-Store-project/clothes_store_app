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
  String? supplier;
  String? categoryId;
  String? subCategory;
  String? typeOfProduct;
  bool? firstVisit;
  String? name;
  String? sKU;
  num? priceBefore;
  num? priceAfter;
  List<String>? imageSrc;
  Desc? desc;
  bool? view;
  /*bool? sizeable;
  bool? colors;
  bool? dressing;*/
  int? iV;
  //Quabtity? quantity;

  ProductModel({this.sId,
    this.supplier,
    this.categoryId,
    this.subCategory,
    this.typeOfProduct,
    this.firstVisit,
    this.name,
    this.sKU,
    this.priceBefore,
    this.priceAfter,
    this.imageSrc,
    this.desc,
    this.view,
    /*this.sizeable,
        this.colors,
        this.dressing,*/
    this.iV,
    //this.quantity}
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    supplier = json['supplier'];
    categoryId = json['category_id'];
    subCategory = json['subCategory'];
    typeOfProduct = json['typeOfProduct'];
    firstVisit = json['first_visit'];
    name = json['name'];
    sKU = json['SKU'];
    priceBefore = json['price_before'];
    priceAfter = json['price_after'];
    imageSrc = json['imageSrc'].cast<String>();
    desc = json['desc'] != null ? new Desc.fromJson(json['desc']) : null;
    view = json['view'];
    /*sizeable = json['sizeable'];
    colors = json['colors'];
    dressing = json['dressing'];*/
    iV = json['__v'];
    /*quantity = json['quantity'] != null
        ? new Quabtity.fromJson(json['quantity'])
        : null;*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['supplier'] = this.supplier;
    data['category_id'] = this.categoryId;
    data['subCategory'] = this.subCategory;
    data['typeOfProduct'] = this.typeOfProduct;
    data['first_visit'] = this.firstVisit;
    data['name'] = this.name;
    data['SKU'] = this.sKU;
    data['price_before'] = this.priceBefore;
    data['price_after'] = this.priceAfter;
    data['imageSrc'] = this.imageSrc;
    if (this.desc != null) {
      data['desc'] = this.desc!.toJson();
    }
    data['view'] = this.view;
    /*data['sizeable'] = this.sizeable;
    data['colors'] = this.colors;
    data['dressing'] = this.dressing;*/
    data['__v'] = this.iV;
    /*if (this.quantity != null) {
      data['quantity'] = this.quantity!.toJson();
    }*/
    return data;
  }
}

class Desc {
  String? type;
  Brand? brand;
  String? description;

  Desc({this.type, this.brand, this.description});

  Desc.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

class Quabtity {
  int? avilable;

  Quabtity({this.avilable});

  Quabtity.fromJson(Map<String, dynamic> json) {
    avilable = json['avilable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avilable'] = this.avilable;
    return data;
  }
}
