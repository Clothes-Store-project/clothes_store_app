class SubCategoryModel {
  List<Response>? response;

  SubCategoryModel({this.response});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(new Response.fromJson(v));
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

class Response {
  String? sId;
  String? name;
  String? mainCategory;
  int? iV;

  Response({this.sId, this.name, this.mainCategory, this.iV});

  Response.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    mainCategory = json['main_category'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['main_category'] = this.mainCategory;
    data['__v'] = this.iV;
    return data;
  }
}
