import 'package:dio/dio.dart';
import 'package:thanglong_university/app/configuration/constant/constant.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';
import 'api_client.dart';
import 'base_model.dart';

enum TranningEndpoint {
  getSubjectById,
  getTranscriptsList,
  getTrascriptById,
  getLearningOutcome,
  getSubjectsListCurrentTerm
}

class TranningRouter extends BaseRouter {
  TranningEndpoint endPoint;
  dynamic data;
  String joinPath;
  bool isLoading = false;
  bool handleError;
  Map<String, dynamic> headers;
  TranningRouter(this.endPoint,
      {this.data, this.joinPath, this.handleError, this.headers});

  @override
  Future<BaseModel> get call async {
    Future<Response<dynamic>> response;
    switch (this.endPoint) {
      case TranningEndpoint.getSubjectById:
        response = client(headers: headerParams).get(path);
        break;

        break;

      case TranningEndpoint.getTranscriptsList:
        response = client(headers: headerParams).get(path);
        break;
      case TranningEndpoint.getTrascriptById:
        response = client(headers: headerParams).get(path);

        break;
      case TranningEndpoint.getLearningOutcome:
        response = client(headers: headerParams).get(path);

        break;
      case TranningEndpoint.getSubjectsListCurrentTerm:
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
      case TranningEndpoint.getSubjectById:
        path = "subject-class/$joinPath";
        break;
      case TranningEndpoint.getTranscriptsList:
        path = "transcript";
        break;
      case TranningEndpoint.getTrascriptById:
        path = "transcript/$joinPath";

        break;
      case TranningEndpoint.getLearningOutcome:
        path = "learning-outcomes";

        break;
      case TranningEndpoint.getSubjectsListCurrentTerm:
        path = "subject-class";
        break;
    }
    return path;
  }
}
