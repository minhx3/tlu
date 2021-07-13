import 'package:dio/dio.dart';
import 'package:thanglong_university/app/configuration/constant/constant.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';
import 'api_client.dart';
import 'base_model.dart';

enum SubjectEndpoint {
  getSubjectsList,
  getSubjectsRegister,
  registerSubjects,
  getAlertRegister,
  getGroupRegister,
  getSubjectsRegisterById,
}

class SubjectRouter extends BaseRouter {
  SubjectEndpoint endPoint;
  dynamic data;
  String joinPath;
  bool isLoading = false;
  bool handleError;
  Map<String, dynamic> headers;
  SubjectRouter(this.endPoint,
      {this.data, this.joinPath, this.handleError, this.headers});

  @override
  Future<BaseModel> get call async {
    Future<Response<dynamic>> response;
    switch (this.endPoint) {
      case SubjectEndpoint.getSubjectsRegister:
        // TODO: Handle this case.
        response = client(headers: headerParams).get(path);
        break;

        break;
      case SubjectEndpoint.registerSubjects:
        response = client(headers: headerParams).post(path, data: data);
        break;
      case SubjectEndpoint.getSubjectsList:
        response = client(headers: headerParams).get(path);

        break;
      case SubjectEndpoint.getAlertRegister:
      case SubjectEndpoint.getGroupRegister:
        response = client(headers: headerParams).get(path);

        break;
      case SubjectEndpoint.getSubjectsRegisterById:
        response = client(headers: headerParams).get(path);

        break;
    }

    return await BaseModel.onBaseModel(response, handleError: handleError);
  }

  @override
  Map<String, dynamic> get headerParams {
    Map<String, dynamic> headers =
        this.headers == null ? Map<String, dynamic>() : this.headers;
    headers["universityCode"] = Constant.universityCode;
    switch (this.endPoint) {
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
      case SubjectEndpoint.getSubjectsRegister:
        path = "register-subject-class";
        break;
      case SubjectEndpoint.registerSubjects:
        path = "register-subject-class";
        break;
      case SubjectEndpoint.getSubjectsList:
        path = "subject-class";

        break;
      case SubjectEndpoint.getAlertRegister:
        path = "alert-register"; // TODO: Handle this case.
        break;

      case SubjectEndpoint.getGroupRegister:
        path = "group-register"; // TODO: Handle this case.
        break;

      case SubjectEndpoint.getSubjectsRegisterById:
        path = "register-subject-class/$joinPath"; // TODO: Handle this case.
        break;
    }
    return path;
  }
}
