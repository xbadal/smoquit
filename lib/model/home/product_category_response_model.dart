import 'package:smoquit/model/base/base_model.dart';
import 'package:smoquit/model/home/product_category_model.dart';

class ProductCategoryResponseModel extends BaseModel {
  List<ProductCategoryModel>? data;

  ProductCategoryResponseModel({
    this.data,
  });

  ProductCategoryResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductCategoryModel>[];
      json['data'].forEach((v) {
        data!.add(ProductCategoryModel.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}
