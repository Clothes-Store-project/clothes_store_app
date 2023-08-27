class SupersDealsModel {
  List<SuperDeals>? response;

  SupersDealsModel({this.response});

  SupersDealsModel.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <SuperDeals>[];
      json['response'].forEach((v) {
        response!.add(new SuperDeals.fromJson(v));
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

class SuperDeals {
  String? sId;
  String? name;
  List<String>? products;
  int? price;
  int? quantity;
  int? iV;

  SuperDeals(
      {this.sId, this.name, this.products, this.price, this.quantity, this.iV});

  SuperDeals.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    products = json['products'].cast<String>();
    price = json['price'];
    quantity = json['quantity'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['products'] = this.products;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['__v'] = this.iV;
    return data;
  }
}
