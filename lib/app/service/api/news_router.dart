import 'package:dio/dio.dart';
import 'package:thanglong_university/app/configuration/constant/constant.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';
import 'api_client.dart';
import 'base_model.dart';

enum NewsEndpoint { getNews, newsDetail }

class NewsRouter extends BaseRouter {
  NewsEndpoint endPoint;
  dynamic data;
  String joinPath;
  bool isLoading = false;
  bool handleError;
  Map<String, dynamic> headers;
  NewsRouter(this.endPoint,
      {this.data, this.joinPath, this.handleError, this.headers});

  @override
  Future<BaseModel> get call async {
    Future<Response<dynamic>> response;
    switch (this.endPoint) {
      case NewsEndpoint.getNews:
        response = client(headers: headerParams).get(path);
        break;

        break;
      case NewsEndpoint.newsDetail:
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

    headers["Authorization"] = Storage.getAccessToken();

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
      case NewsEndpoint.getNews:
        path = "school-news";
        break;
      case NewsEndpoint.newsDetail:
        path = "school-news/$joinPath";
        break;
    }
    return path;
  }
}
