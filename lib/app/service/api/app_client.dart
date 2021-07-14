import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:thanglong_university/app/model/access_token_model.dart';
import 'package:thanglong_university/app/model/news_model.dart';
import 'package:thanglong_university/app/model/process_model.dart';
import 'package:thanglong_university/app/model/register_entity.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/model/schedule_model.dart';
import 'package:thanglong_university/app/model/subject_model.dart';
import 'package:thanglong_university/app/model/test_schedule_model.dart';
import 'package:thanglong_university/app/model/transcript_model.dart';
import 'package:thanglong_university/app/model/user_model.dart';
import 'package:thanglong_university/app/service/api/api_client.dart';
import 'package:thanglong_university/app/service/api/authen_router.dart';
import 'package:thanglong_university/app/service/api/news_router.dart';
import 'package:thanglong_university/app/service/api/schedule_router.dart';
import 'package:thanglong_university/app/service/api/subject_router.dart';
import 'package:thanglong_university/app/service/api/trainning_router.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';

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

  Future<UserModel> getUserInfo() async {
    final result = await AuthenRouter(isTeacher == true
            ? AuthenEndpoint.getTeacher
            : AuthenEndpoint.getStudent)
        .call;

    if (result?.statusCode == 200) {
      return UserModel.fromJson(result.data);
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

  Future<List<SubjectModel>> getSubjectListPreRegister() async {
    final result =
        await SubjectRouter(SubjectEndpoint.getSubjectsRegister).call;

    if (result?.statusCode == 200) {
      List<SubjectModel> list = [];
      result.data.forEach((e) {
        list.add(SubjectModel.fromJson(e));
      });
      return list;
    } else {
      return null;
    }
  }

  Future<List<SubjectModel>> getSubjectList() async {
    final result = await SubjectRouter(SubjectEndpoint.getSubjectsList).call;

    if (result?.statusCode == 200) {
      List<SubjectModel> list = [];
      result.data.forEach((e) {
        list.add(SubjectModel.fromJson(e));
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

  Future<List<ScheduleModel>> getScheduleList(
      {String fromDate, String toDate}) async {
    Map<String, dynamic> data = {};
    data["fromDate"] = fromDate.split("/").reversed.join("/");
    data["toDate"] = toDate.split("/").reversed.join("/");
    final result =
        await ScheduleRouter(ScheduleEndpoint.getScheduleList, data: data).call;

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

  Future<List<Score>> getTranscriptsById(String id) async {
    final result =
        await TranningRouter(TranningEndpoint.getTranscriptsList, joinPath: id)
            .call;
    if (result?.statusCode == 200) {
      List<Score> list = [];
      result.data.forEach((e) {
        list.add(Score.fromJson(e));
      });
      return list;
    } else {
      return null;
    }
  }
}
