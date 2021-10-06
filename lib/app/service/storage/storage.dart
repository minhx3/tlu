import 'package:get_storage/get_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:thanglong_university/app/configuration/constant/constant.dart';
import 'package:thanglong_university/app/configuration/constant/key.dart';

class Storage {
  static get(String key) => GetStorage().read(key);

  static set(String key, dynamic value) => GetStorage().write(key, value);

  static remove(String key) => GetStorage().remove(key);

  static clear() => GetStorage().erase();

  static setAccessToken(String value) => set(Keys.accessToken, value);

  static setRefreshToken(String value) => set(Keys.refreshToken, value);

  static setPrivateKey(String value) => set(Keys.privateKey, value);

  static String getAccessToken() => get(Keys.accessToken);

  static String getPrivateKey() => get(Keys.privateKey);

  static String getRefreshToken() => get(Keys.refreshToken);

  static setPhoneNumber(String value) => set(Keys.userId, value);

  static setUserId(String value) => set(Keys.userId, value);

  static String getUserId() => get(Keys.userId);

  static getPassword() => get(Keys.password);

  static setLanguage(String value) => set(Keys.locale, value);

  static getLanguage() => get(Keys.locale);

  static setUserType(String value) => set(Keys.userType, value);

  static getUserType() => get(Keys.userType);

  static setName(String value) => set(Keys.userToken, value);

  static String getName() => get(Keys.userToken);

  static setUserToken(String value) => set(Keys.userToken, value);

  static String getUserToken() => get(Keys.userToken);
}

bool get isTeacher => Storage.getUserType() == Constant.teacher ? true : false;

String userId;

String get getUserId {
  if (userId != null) {
    return userId;
  }
  String token = Storage.getAccessToken();
  Map<String, dynamic> payload = Jwt.parseJwt(token);
  userId = payload['data']['userId'];
  return userId;
}
