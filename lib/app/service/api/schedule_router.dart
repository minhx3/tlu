import 'package:dio/dio.dart';
import 'package:thanglong_university/app/configuration/constant/constant.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';
import 'api_client.dart';
import 'base_model.dart';

enum ScheduleEndpoint { getSchedules, getScheduleList }

class ScheduleRouter extends BaseRouter {
  ScheduleEndpoint endPoint;
  dynamic data;
  String joinPath;
  bool isLoading = false;
  bool handleError;
  Map<String, dynamic> headers;
  ScheduleRouter(this.endPoint,
      {this.data, this.joinPath, this.handleError, this.headers});

  @override
  Future<BaseModel> get call async {
    Future<Response<dynamic>> response;
    switch (this.endPoint) {
      case ScheduleEndpoint.getSchedules:
        // TODO: Handle this case.
        response =
            client(headers: headerParams).get(path, queryParameters: data);
        break;

        break;
      case ScheduleEndpoint.getScheduleList:
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
      case ScheduleEndpoint.getSchedules:
        path = "test-schedule";
        break;
      case ScheduleEndpoint.getScheduleList:
        path =
            "schedule/tasks?fromDate=${data["fromDate"]}&toDate=${data["toDate"]}";
        break;
    }
    return path;
  }
}
