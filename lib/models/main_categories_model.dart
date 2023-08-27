class MainCategoriesModel {
  List<MainCategory>? response;

  MainCategoriesModel({this.response});

  MainCategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <MainCategory>[];
      json['response'].forEach((v) {
        response!.add(new MainCategory.fromJson(v));
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

class MainCategory {
  String? sId;
  String? name;
  int? iV;

  MainCategory({this.sId, this.name, this.iV});

  MainCategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['__v'] = this.iV;
    return data;
  }
}
