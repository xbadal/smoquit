import '../base/base_model.dart';
import '../user/user.dart';

class AuthenticationModel extends BaseModel {
  User? user;

  AuthenticationModel({this.user});

  AuthenticationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    displayMessage = json['display_message'];
    errorMessage = json['error_message'];
    error = json['error'];
    user = json['data'] != null ? User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['message'] = this.message;
    data['display_message'] = this.displayMessage;
    data['error_message'] = this.errorMessage;
    data['error'] = this.error;
    if (user != null) {
      data['data'] = user?.toJson();
    }
    return data;
  }
}
