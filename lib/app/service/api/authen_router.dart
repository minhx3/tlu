import 'package:dio/dio.dart';
import 'package:thanglong_university/app/configuration/constant/constant.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';
import 'api_client.dart';
import 'base_model.dart';

enum AuthenEndpoint {
  register,
  login,
  refreshToken,
  forgoPassword,
  getStudent,
  updateStudent,
  getTeacher,
  updateTeacher
}

class AuthenRouter extends BaseRouter {
  AuthenEndpoint endPoint;
  dynamic data;
  String joinPath;
  bool isLoading = false;
  bool handleError;
  Map<String, dynamic> headers;
  AuthenRouter(this.endPoint,
      {this.data, this.joinPath, this.handleError, this.headers});

  @override
  Future<BaseModel> get call async {
    Future<Response<dynamic>> response;
    switch (this.endPoint) {
      case AuthenEndpoint.register:
        break;
      case AuthenEndpoint.login:
        response = client(headers: headerParams).post(path, data: data);
        break;
      case AuthenEndpoint.refreshToken:
        response = client().get(path, queryParameters: data);

        break;
      case AuthenEndpoint.forgoPassword:
        response = client().post(path, data: data);

        break;
      case AuthenEndpoint.getStudent:
        response = client(headers: headerParams).get(path);

        break;
      case AuthenEndpoint.updateStudent:
        break;
      case AuthenEndpoint.getTeacher:
        response = client(headers: headerParams).get(path);

        break;
      case AuthenEndpoint.updateTeacher:
        break;
    }

    return await BaseModel.onBaseModel(response, handleError: handleError);
  }

  @override
  Map<String, dynamic> get headerParams {
    Map<String, dynamic> headers =
        this.headers == null ? Map<String, dynamic>() : this.headers;
    headers["universityCode"] = Constant.universityCode;
    headers["Access-Control-Allow-Headers"] = "*";
    headers["Access-Control-Allow-Methods"] =
        "POST, GET, OPTIONS, PUT, DELETE, HEAD";
    headers["Access-Control-Allow-Origin"] = "*";
    switch (this.endPoint) {
      case AuthenEndpoint.login:
        break;

      default:
        headers["Authorization"] = Storage.getAccessToken();
    }
    return headers;
  }

  @override
  bool isShowLoading() {
    return false;
  }

  @override
  String get path {
    var path = "";
    switch (this.endPoint) {
      case AuthenEndpoint.register:
        break;
      case AuthenEndpoint.login:
        path = "/token";
        break;
      case AuthenEndpoint.refreshToken:
        path = "/token";
        break;
      case AuthenEndpoint.forgoPassword:
        path = "/passwords";
        break;
      case AuthenEndpoint.getStudent:
        path = "/student";
        break;
      case AuthenEndpoint.updateStudent:
        path = "/student";

        break;
      case AuthenEndpoint.getTeacher:
        path = "/teacher";

        break;
      case AuthenEndpoint.updateTeacher:
        path = "/teacher";

        break;
    }
    return path;
  }
}
