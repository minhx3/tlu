import 'package:dio/dio.dart';
import 'package:get/get.dart' as prefix;
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';

class BaseModel {
  String message;
  int statusCode;
  int errorCode;
  String errorSource;
  String errorReason;
  bool timeout;
  DioError error;

  BaseModel({this.dataList, this.data, this.error});

  BaseModel.fromJson(dynamic json, int code) {
    statusCode = code;

    if (code == 200) {
      data = json;
    } else {
      errorCode = json['errors'][0]['errorCode'];
      errorSource = json['errors'][0]['errorSource'];
      errorReason = json['errors'][0]['errorReason'];
      error = json['error'];
    }
  }

  List<dynamic> dataList;

  dynamic data;

  // BaseModel.fromJson(Map<String, dynamic> json) {
  //   data = json;
  //   name = json['name'];
  //   message = json['message'];
  //   permission = json['permission'];
  //   success = json['success'];
  //   code = json['code'];
  //   version = json['version'];
  // }
  // BaseModel.fromJsonList(List<dynamic> json) {
  //   dataList = json;
  // }

  static onBaseModel(Future<Response<dynamic>> response,
      {bool handleError = false}) async {
    DioError err;
    var result = await response.catchError((onError) {
      err = (onError as DioError);
    });
    if (prefix.Get.isDialogOpen == true) {
      hideLoadingGlobal();
    }
    BaseModel model;
    if (result != null ||
        result?.statusCode == 200 ||
        result?.statusCode == 204) {
      model = BaseModel.fromJson(result.data, result.statusCode);
      return model;
    }

    if (err.response?.statusCode == 307) {
      model = BaseModel.fromJson(err.response.data, err.response.statusCode);
      return model;
    }
    if (err.response?.statusCode == null) {
      showErrorMessage(message: "Lỗi kết nối.");
      return null;
    }
    if (err?.response?.data == null || !(err?.response?.data is Map)) {
      showErrorMessage(message: "Có lỗi xảy ra vui lòng thử lại.");
      return null;
    }

    model = BaseModel.fromJson(err.response.data, err.response.statusCode);
    model.error = err;
    if (handleError == true && handleError != null) {
      return model;
    }
    model?.message != null
        ? showErrorMessage(message: model?.message ?? "", duration: 5)
        : showErrorMessage(message: model?.errorReason ?? "", duration: 5);

    if (err.response.statusCode == 401 &&
        prefix.Get.currentRoute != Routes.AUTH) {
      pushReplaceAllTo(Routes.AUTH);
    } else if (err.response.statusCode == 500 ||
        err.response.statusCode == 502) {
      showErrorMessage(message: model?.errorReason ?? "");
    } else {
      showErrorMessage(
          message: model?.errorReason ?? "Có lỗi xảy ra vui lòng thử lại.");
    }
  }
}

class Errors {
  int errorCode;
  String errorSource;
  String errorReason;
  bool timeout;

  Errors({this.errorCode, this.errorSource, this.errorReason, this.timeout});

  Errors.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorSource = json['errorSource'];
    errorReason = json['errorReason'];
    timeout = json['timeout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['errorSource'] = this.errorSource;
    data['errorReason'] = this.errorReason;
    data['timeout'] = this.timeout;
    return data;
  }
}
