import 'package:dio/dio.dart';
import 'package:thanglong_university/app/configuration/constant/constant.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';
import 'api_client.dart';
import 'base_model.dart';

enum EventEndpoint { getEvents, createEvents }

class EventRouter extends BaseRouter {
  EventEndpoint endPoint;
  dynamic data;
  String joinPath;
  bool isLoading = false;
  bool handleError;
  Map<String, dynamic> headers;
  EventRouter(this.endPoint,
      {this.data, this.joinPath, this.handleError, this.headers});

  @override
  Future<BaseModel> get call async {
    Future<Response<dynamic>> response;
    switch (this.endPoint) {
      case EventEndpoint.getEvents:
        // TODO: Handle this case.
        response =
            client(headers: headerParams).get(path, queryParameters: data);
        break;

        break;
      case EventEndpoint.createEvents:
        response = client(headers: headerParams).post(path, data: data);
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
      case EventEndpoint.getEvents:
        path = "events";
        break;
      case EventEndpoint.createEvents:
        path = "events";
        break;
    }
    return path;
  }
}
