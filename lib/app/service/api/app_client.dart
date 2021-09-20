import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:thanglong_university/app/enums/notification_type_enum.dart';
import 'package:thanglong_university/app/model/access_token_model.dart';
import 'package:thanglong_university/app/model/chat/subject_class_entity.dart';
import 'package:thanglong_university/app/model/chat/user_entity.dart';
import 'package:thanglong_university/app/model/news_model.dart';
import 'package:thanglong_university/app/model/notification_model.dart';
import 'package:thanglong_university/app/model/process_model.dart';
import 'package:thanglong_university/app/model/register_entity.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/model/schedule_model.dart';
import 'package:thanglong_university/app/model/schedule_teacher_model.dart';
import 'package:thanglong_university/app/model/score_detail_entity.dart';
import 'package:thanglong_university/app/model/test_schedule_model.dart';
import 'package:thanglong_university/app/model/transcript_model.dart';
import 'package:thanglong_university/app/model/user_info_model.dart';
import 'package:thanglong_university/app/model/user_setting_model.dart';
import 'package:thanglong_university/app/service/api/api_client.dart';
import 'package:thanglong_university/app/service/api/authen_router.dart';
import 'package:thanglong_university/app/service/api/news_router.dart';
import 'package:thanglong_university/app/service/api/notification_router.dart';
import 'package:thanglong_university/app/service/api/schedule_router.dart';
import 'package:thanglong_university/app/service/api/setting_router.dart';
import 'package:thanglong_university/app/service/api/subject_router.dart';
import 'package:thanglong_university/app/service/api/trainning_router.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';

import 'base_model.dart';
import 'common_router.dart';

class Appclient {
  static Appclient shared = Appclient();
  static String generateToken;

  Appclient() {
    dio.interceptors.add(alice.getDioInterceptor());
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: false,
        maxWidth: 90));
  }

  Future<AccessTokenModel> loginUser(
      {@required String username,
      @required String password,
      @required String type}) async {
    Map<String, dynamic> data = {};
    data["username"] = username;
    data["password"] = password;
    data["customerType"] = type;
    final result =
        await AuthenRouter(AuthenEndpoint.login, data: data, handleError: true)
            .call;

    if (result?.statusCode == 200) {
      return AccessTokenModel.fromJson(result.data);
    } else {
      return null;
    }
  }

  Future<bool> forgoPassword({@required String username}) async {
    Map<String, dynamic> data = {'phone': username};
    final result =
        await AuthenRouter(AuthenEndpoint.forgoPassword, data: data).call;
    if (result?.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> verifyOTP({@required String otp}) async {
    Map<String, dynamic> data = {'otp': otp};
    final result =
        await AuthenRouter(AuthenEndpoint.verifyOTP, data: data).call;
    if (result?.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> confirmPassword(
      {String otp, String phone, String pass, String passConfirm}) async {
    Map<String, dynamic> data = {
      "otp": otp,
      "phone": phone,
      "password": pass,
      "passwordConfirm": passConfirm
    };
    final result =
        await AuthenRouter(AuthenEndpoint.confirmPassword, data: data).call;
    if (result?.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<UserInfo> getUserInfo() async {
    final result = await AuthenRouter(isTeacher == true
            ? AuthenEndpoint.getTeacher
            : AuthenEndpoint.getStudent)
        .call;

    if (result?.statusCode == 200) {
      return UserInfo.fromJson(result.data);
    } else {
      return null;
    }
  }

  Future<UserSetting> getUserSettings() async {
    final result = await SettingRouter(SettingEndpoint.getSettings).call;

    if (result?.statusCode == 200) {
      return UserSetting.fromJson(result.data);
    } else {
      return null;
    }
  }

  Future<UserSetting> changeUserSettings(
      {@required Map<String, dynamic> data}) async {
    final result =
        await SettingRouter(SettingEndpoint.changeSettings, data: data).call;

    if (result?.statusCode == 200) {
      return UserSetting.fromJson(result.data);
    } else {
      return null;
    }
  }

  // Future<List<ScheduleModel>> getCalendarList() async {
  //   Map<String, dynamic> data = {};
  //   final result = await EventRouter(EventEndpoint.getEvents, data: data).call;
  //
  //   if (result?.statusCode == 200) {
  //     List<ScheduleModel> list = [];
  //     result.data.forEach((e) {
  //       list.add(ScheduleModel.fromJson(e));
  //     });
  //     return list;
  //   } else {
  //     return null;
  //   }
  // }

  Future<RegisterEntity> getAlertRegister() async {
    final result = await SubjectRouter(SubjectEndpoint.getAlertRegister).call;

    if (result?.statusCode == 200) {
      return RegisterEntity().fromJson(result.data);
    } else {
      return null;
    }
  }

  Future<List<RegisterEntity>> getGroupRegister() async {
    final result = await SubjectRouter(SubjectEndpoint.getGroupRegister).call;

    if (result?.data is List) {
      return (result.data as List)
          .map((e) => RegisterEntity().fromJson(e))
          .toList();
    } else {
      return null;
    }
  }

  Future<List<RegisterSubjectEntity>> getSubjectsRegisterById(String id) async {
    final result = await SubjectRouter(SubjectEndpoint.getSubjectsRegisterById,
            joinPath: id)
        .call;

    if (result?.data is List) {
      return (result.data as List)
          .map((e) => RegisterSubjectEntity().fromJson(e))
          .toList();
    } else {
      return null;
    }
  }

  Future<RegisterSubjectEntity> getSubjectsClassById(String id) async {
    final result = await SubjectRouter(SubjectEndpoint.getSubjectsClassDetail,
            joinPath: id, handleError: true)
        .call;

    if (result.statusCode != 200) {
      return null;
    }

    return RegisterSubjectEntity().fromJson(result.data);
  }

  Future<BaseModel> postRegisterSubjectClass(String subjectClassId) async {
    return await SubjectRouter(SubjectEndpoint.registerSubjectClass,
            data: {"subjectClassId": subjectClassId}, handleError: true)
        .call;
  }

  getSubjectsCart() async {
    final subjectCart =
        await SubjectRouter(SubjectEndpoint.getSubjectsCart, handleError: true)
            .call;
    return subjectCart;
  }

  addSubjectToCart(String subjectClassId) async {
    final subjectCart = await SubjectRouter(SubjectEndpoint.addSubjectToCart,
            joinPath: subjectClassId, handleError: true)
        .call;
    return subjectCart;
  }

  deleteSubjectFromCart(String subjectClassId) async {
    return await SubjectRouter(SubjectEndpoint.deleteSubjectFromCart,
            joinPath: subjectClassId, handleError: true)
        .call;
  }

  Future<List<NewsModel>> getNews() async {
    final result = await NewsRouter(NewsEndpoint.getNews).call;

    if (result?.statusCode == 200) {
      List<NewsModel> newsList = [];
      result.data.forEach((e) {
        newsList.add(NewsModel.fromJson(e));
      });
      return newsList;
    } else {
      return null;
    }
  }

  Future<NewsModel> getNewDetail(String id) async {
    final result = await NewsRouter(NewsEndpoint.newsDetail, joinPath: id).call;

    if (result?.statusCode == 200) {
      return NewsModel.fromJson(result.data);
    } else {
      return null;
    }
  }

  Future<List<RegisterSubjectEntity>> getSubjectListPreRegister() async {
    final result =
        await SubjectRouter(SubjectEndpoint.getSubjectsRegister).call;

    if (result?.statusCode == 200) {
      List<RegisterSubjectEntity> list = [];
      result.data.forEach((e) {
        list.add(RegisterSubjectEntity().fromJson(e));
      });
      return list;
    } else {
      return null;
    }
  }

  Future<List<SubjectClassEntity>> getSubjectClassList(isCurrent) async {
    final result = await SubjectRouter(SubjectEndpoint.getSubjectClassList,
        data: {"isCurrent": isCurrent}).call;

    if (result?.data is List) {
      return (result?.data as List)
          .map((e) => SubjectClassEntity().fromJson(e))
          .toList();
    } else {
      return null;
    }
  }

  Future<List<UserEntity>> getUserList(sbId) async {
    final result =
        await SubjectRouter(SubjectEndpoint.getUserList, joinPath: sbId).call;

    if (result?.data is List) {
      return (result?.data as List)
          .map((e) => UserEntity().fromJson(e))
          .toList();
    } else {
      return null;
    }
  }

  Future<List<RegisterSubjectEntity>> getSubjectList(bool isOther) async {
    final result = await SubjectRouter(SubjectEndpoint.getSubjectsList,
        data: {'other': isOther}).call;

    if (result?.statusCode == 200) {
      List<RegisterSubjectEntity> list = [];
      result.data.forEach((e) {
        list.add(RegisterSubjectEntity().fromJson(e));
      });
      return list;
    } else {
      return null;
    }
  }

  Future<ProcessModel> getLearningComeout() async {
    final result =
        await TranningRouter(TranningEndpoint.getLearningOutcome).call;

    if (result?.statusCode == 200) {
      return ProcessModel.fromJson(result.data);
    } else {
      return null;
    }
  }

  Future<List<TestScheduleModel>> getTestSchedule() async {
    final result = await ScheduleRouter(ScheduleEndpoint.getSchedules).call;

    if (result?.statusCode == 200) {
      List<TestScheduleModel> list = [];
      result.data.forEach((e) {
        list.add(TestScheduleModel.fromJson(e));
      });
      return list;
    } else {
      return null;
    }
  }

  Future<List<TranscriptModel>> getTranscriptsList() async {
    final result =
        await TranningRouter(TranningEndpoint.getTranscriptsList).call;

    if (result?.statusCode == 200) {
      List<TranscriptModel> list = [];
      result.data.forEach((e) {
        list.add(TranscriptModel.fromJson(e));
      });
      return list;
    } else {
      return null;
    }
  }

  Future<ScoreDetailEntity> getTrascriptById(String id) async {
    final result =
        await TranningRouter(TranningEndpoint.getTrascriptById, joinPath: id)
            .call;

    if (result?.statusCode == 200) {
      return ScoreDetailEntity.fromJson(result.data);
    } else {
      return null;
    }
  }

  Future<List<ScheduleModel>> getScheduleList(
      {String fromDate, String toDate}) async {
    final result =
        await ScheduleRouter(ScheduleEndpoint.getScheduleList, data: {
      "fromDate": fromDate,
      "toDate": toDate,
    }).call;

    if (result?.statusCode == 200) {
      List<ScheduleModel> list = [];
      result.data.forEach((e) {
        list.add(ScheduleModel.fromJson(e));
      });
      return list;
    } else {
      return null;
    }
  }

  Future<Map<String, List<ScheduleTeacherModel>>> getScheduleTeacherList(
      {String fromDate, String toDate}) async {
    final result =
        await ScheduleRouter(ScheduleEndpoint.getScheduleTeacherList).call;

    if (result?.statusCode == 200) {
      List<ScheduleTeacherModel> list = [];
      result.data.forEach((e) {
        list.add(ScheduleTeacherModel.fromJson(e));
      });
      return groupBy(list, (e) => e.subjectId);
    } else {
      return null;
    }
  }

  Future<bool> toggleFavourite({String taskId, bool value}) async {
    final result =
        await ScheduleRouter(ScheduleEndpoint.toggleFavourite, joinPath: taskId, data: {
          "favourite": value
        })
            .call;

    if (result?.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // Future<List<Score>> getTranscriptsById(String id) async {
  //   final result =
  //       await TranningRouter(TranningEndpoint.getTranscriptsList, joinPath: id)
  //           .call;
  //   if (result?.statusCode == 200) {
  //     List<Score> list = [];
  //     result.data.forEach((e) {
  //       list.add(Score.fromJson(e));
  //     });
  //     return list;
  //   } else {
  //     return null;
  //   }
  // }

  Future<dynamic> uploadFile(dataImg) async {
    FormData formData = FormData();
    var files = MapEntry(
      "files",
      MultipartFile.fromFileSync(dataImg?.path ?? '',
          filename: dataImg.path.split("/").last ?? "tlu_file.jpg"),
    );
    formData.files.add(files);

    final result =
        await CommonRouter(CommonEndpoint.upload, data: formData).call;
    if (result?.data != null) {
      List<dynamic> resUrl = result.data;
      return resUrl.first;
    } else {
      return null;
    }
  }

  Future<List<NotificationModel>> getNotificationList(
      NotificationTypeEnum type) async {
    final result = await NotificationRouter(
        NotificationEndpoint.getNotification,
        data: {type: notificationTypeValues.reverse[type]}).call;

    if (result?.statusCode == 200) {
      List<NotificationModel> list = [];
      result.data.forEach((e) {
        list.add(NotificationModel.fromJson(e));
      });
      return list;
    } else {
      return null;
    }
  }

  Future<bool> readAllNotification() async {
    final result =
        await NotificationRouter(NotificationEndpoint.readAllNotification).call;
    return result?.statusCode == 200;
  }

  Future<bool> readOneNotification(String id) async {
    final result = await NotificationRouter(
            NotificationEndpoint.readOneNotification,
            joinPath: id)
        .call;
    return result?.statusCode == 200;
  }
}
