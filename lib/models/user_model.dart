class UserModel {
  Respone? respone;

  UserModel({this.respone});

  UserModel.fromJson(Map<String, dynamic> json) {
    respone =
    json['respone'] != null ? new Respone.fromJson(json['respone']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.respone != null) {
      data['respone'] = this.respone!.toJson();
    }
    return data;
  }
}

class Respone {
  String? sId;
  String? username;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? telephone;
  int? iV;

  Respone(
      {this.sId,
        this.username,
        this.email,
        this.password,
        this.firstName,
        this.lastName,
        this.telephone,
        this.iV});

  Respone.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    telephone = json['telephone'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['telephone'] = this.telephone;
    data['__v'] = this.iV;
    return data;
  }
}
