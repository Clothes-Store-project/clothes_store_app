class WishlistModel {
  List<WishModel>? response;

  WishlistModel({this.response});

  WishlistModel.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <WishModel>[];
      json['response'].forEach((v) {
        response!.add(new WishModel.fromJson(v));
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

class WishModel {
  String? sId;
  String? userId;
  String? productId;
  int? iV;

  WishModel({this.sId, this.userId, this.productId, this.iV});

  WishModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    productId = json['product_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['__v'] = this.iV;
    return data;
  }
}
