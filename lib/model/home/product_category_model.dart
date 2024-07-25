class ProductCategoryModel {
  String? id;
  String? category;
  String? categorykey;
  String? createdId;
  String? createdOn;
  String? status;

  ProductCategoryModel({this.id, this.category, this.categorykey, this.createdId, this.createdOn, this.status});

  ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    categorykey = json['categorykey'];
    createdId = json['created_id'];
    createdOn = json['created_on'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['categorykey'] = this.categorykey;
    data['created_id'] = this.createdId;
    data['created_on'] = this.createdOn;
    data['status'] = this.status;
    return data;
  }
}
