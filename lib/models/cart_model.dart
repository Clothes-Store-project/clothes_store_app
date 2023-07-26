class CartsModel {
  List<CartModel>? response;

  CartsModel({this.response});

  CartsModel.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <CartModel>[];
      json['response'].forEach((v) {
        response!.add(new CartModel.fromJson(v));
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

class CartModel {
  String? sId;
  String? userId;
  String? productId;
  int? quantity;
  int? iV;

  CartModel({this.sId, this.userId, this.productId, this.quantity, this.iV});

  CartModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['__v'] = this.iV;
    return data;
  }
}
