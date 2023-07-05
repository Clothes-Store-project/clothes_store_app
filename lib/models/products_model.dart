class ProductsModel {
  String? sId;
  String? name;
  List<String>? imageSrc;
  String? desc;
  int? quantity;
  String? sKU;
  String? categoryId;
  int? price;
  String? discountId;
  int? iV;

  ProductsModel(
      {this.sId,
        this.name,
        this.imageSrc,
        this.desc,
        this.quantity,
        this.sKU,
        this.categoryId,
        this.price,
        this.discountId,
        this.iV});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    imageSrc = json['imageSrc'].cast<String>();
    desc = json['desc'];
    quantity = json['quantity'];
    sKU = json['SKU'];
    categoryId = json['category_id'];
    price = json['price'];
    discountId = json['discount_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['imageSrc'] = this.imageSrc;
    data['desc'] = this.desc;
    data['quantity'] = this.quantity;
    data['SKU'] = this.sKU;
    data['category_id'] = this.categoryId;
    data['price'] = this.price;
    data['discount_id'] = this.discountId;
    data['__v'] = this.iV;
    return data;
  }
}