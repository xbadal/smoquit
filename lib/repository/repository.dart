import 'dart:convert';

import '../app/dio_injector.dart';
import '../app/locator.dart';
import '../exception/app_exception.dart';
import '../helper/url_provider.dart';
import '../model/auth/authentication_model.dart';
import '../model/home/product_category_response_model.dart';

class ApiRepository {
  final _injector = locator<DioInjector>();

  static const mobileRegex = r'^([0-9][\s]*){10,10}$';

  Future<AuthenticationModel> loginUser({String? email, String? password, String? deviceId, String? fcmId}) async {
    final isMobileEmpty = email?.isEmpty ?? true;
    final isPasswordEmpty = password?.isEmpty ?? true;

    // if (isMobileEmpty || !RegExp(mobileRegex).hasMatch(mobile!)) {
    //   throw AppException(message: 'Please enter a valid mobile number');
    // }

    if (isMobileEmpty) {
      throw AppException(message: 'Please enter a valid email address');
    }
    if (isPasswordEmpty) {
      throw AppException(message: 'Please enter a valid password');
    }

    final data = <String, dynamic>{
      'mobileno': email,
      'password': password,
      "deviceId": deviceId ?? '',
      "fcmtoken": fcmId ?? ''
    };

    final response = await _injector.dio.post(kuLoginUrl, data: jsonEncode(data));
    if (response.statusCode == 200) {
      final _result = AuthenticationModel.fromJson(response.data);
      if (_result.status == 0) {
        return _result;
      }
      throw AppException(message: _result.message!);
    }
    throw AppException(message: response.statusMessage!);
  }
}
