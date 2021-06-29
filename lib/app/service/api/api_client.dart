import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import 'base_model.dart';

final dio = Dio();
final alice = Alice(
    showNotification: false,
    showInspectorOnShake: true,
    navigatorKey: getx.Get.key);

Dio client({String baseURL, Map<String, dynamic> headers}) {
  dio.options.connectTimeout = 60000;
  // dio.options.baseUrl = "http://172.168.192.211:1337/"; //
  dio.options.baseUrl = "https://tlu-api.awe7.com/api-v1/";
  if (headers != null) {
    dio.options.headers = headers;
  }
  // _setupLoggingInterceptor(dio);

  return dio;
}

// _setupLoggingInterceptor(Dio dio) {
//   dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
//     print("Header -> ${options.headers}");
//     print("--> ${options.method} ${options.path}");
//     print("Content type: ${options.contentType}");
//     print("Data: ${options.data}");
//     return options; //continue
//   }, onResponse: (Response response) {
//     // Do something with response data
//     print(
//         "<-- ${response.statusCode} ${response.request.method} ${response.request.path}");
//     String responseAsString = response.data.toString();
//     print(responseAsString);
//     print("<-- END HTTP -->");
//     return response; // continue
//   }, onError: (DioError e) {
//     // Do something with response error
//     return e; //continue
//   }));
// }

abstract class BaseRouter {
  String get path;
  Future<BaseModel> get call;
  Map<String, dynamic> get headerParams;
  bool isShowLoading();
}
