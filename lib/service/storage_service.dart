import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../constant/app_keys.dart';
import '../model/user/user.dart';

class StorageService {
  var logger = Logger(
    printer: PrettyPrinter(),
  );
  static const _preferenceBox = "infinix";

  static StorageService? _instance;

  StorageService._(this._box);

  final GetStorage _box;

  static Future<StorageService> getInstance() async {
    final box = GetStorage(_preferenceBox);
    _instance ??= StorageService._(box);
    return _instance!;
  }

  Future<void> saveAuthToken(String value) {
    return _setValue(kkAuthTokenKey, value);
  }

  Future<void> saveUser(User user) {
    return _setValue<User>(kkUserKey, user);
  }

  Future<void> saveFCMToken(String value) {
    return _setValue<String>(kkFcmTokenKey, value);
  }

  String get fcmToken =>
      _getValue(
        kkFcmTokenKey,
      ) ??
      '';

  String get authToken =>
      _getValue(
        kkAuthTokenKey,
      ) ??
      '';

  Future<User?> get user async {
    dynamic data = await _getValue(kkUserKey);
    // Map<String, dynamic>? data = await _getValue(kkUserKey);

    if (data != null) {
      if (data is User) {
        return data;
      }

      if (data is Map) {
        Map<String, dynamic>? temp = await _getValue(kkUserKey);
        return User.fromJson(temp!);
      }
    }
    return null;
  }

  Future<void> clearAll() {
    return _box.erase();
  }

  _getValue(dynamic key) {
    return _box.read(key);
  }

  Future<void> _setValue<T>(dynamic key, T? value) => _box.write(key, value);
}
