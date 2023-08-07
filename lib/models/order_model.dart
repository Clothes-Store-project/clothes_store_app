class OrderModel {
  String? sId;
  String? userId;
  List<Products>? products;
  String? phone;
  String? country;
  String? firstName;
  String? lastName;
  String? address;
  String? city;
  String? zipCode;
  String? payment;
  String? totalPrice;
  String? status;
  List<String>? suppliers;
  String? returnrequest;
  String? createdAt;
  String? updatedAt;
  int? iV;

  OrderModel(
      {this.sId,
        this.userId,
        this.products,
        this.phone,
        this.country,
        this.firstName,
        this.lastName,
        this.address,
        this.city,
        this.zipCode,
        this.payment,
        this.totalPrice,
        this.status,
        this.suppliers,
        this.returnrequest,
        this.createdAt,
        this.updatedAt,
        this.iV});

  OrderModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    phone = json['phone'];
    country = json['country'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    address = json['address'];
    city = json['city'];
    zipCode = json['zipCode'];
    payment = json['payment'];
    totalPrice = json['totalPrice'];
    status = json['status'];
    suppliers = json['suppliers'].cast<String>();
    returnrequest = json['returnrequest'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['phone'] = this.phone;
    data['country'] = this.country;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['address'] = this.address;
    data['city'] = this.city;
    data['zipCode'] = this.zipCode;
    data['payment'] = this.payment;
    data['totalPrice'] = this.totalPrice;
    data['status'] = this.status;
    data['suppliers'] = this.suppliers;
    data['returnrequest'] = this.returnrequest;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Products {
  String? productId;
  String? name;
  String? image;
  String? sKU;
  String? quantity;
  String? sId;

  Products(
      {this.productId,
        this.name,
        this.image,
        this.sKU,
        this.quantity,
        this.sId});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    image = json['image'];
    sKU = json['SKU'];
    quantity = json['quantity'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['SKU'] = this.sKU;
    data['quantity'] = this.quantity;
    data['_id'] = this.sId;
    return data;
  }
}