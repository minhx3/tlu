import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thanglong_university/app/configuration/base/app_controller.dart';
import 'package:thanglong_university/app/model/schedule_model.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';
import 'package:thanglong_university/app/views/views/calendar/flutter_calendar.dart';
import 'package:intl/date_symbol_data_local.dart'; //for date locale

class ScheduleController extends AppController {
  CalendarController calendarController = CalendarController();

  final tagIndex = 0.obs;
  final isFilter = false.obs;
  final currentDay = DateTime.now().day.obs;
  final rxWeekDay = "".obs;
  String fromDate = "";
  String toDate = "";
  var currentDate = DateTime.now();
  final rxScheduleList = RxList<ScheduleModel>();
  StreamSubscription streamSubscription;
  @override
  void onInit() {
    super.onInit();
    initializeDateFormatting("vi");
    streamSubscription = tagIndex.listen((index) {
      print(index);
      getCase(index);
    });

    getCase(0);
  }

  getCase(index) {
    currentDate = DateTime.now();
    switch (index) {
      case 0:
        fromDate = getToday();
        toDate = getToday();
        break;
      case 1:
        rxWeekDay(getWeekDay());

        break;
      case 2:
        rxWeekDay(getMonth());

        break;
      default:
    }
    getScheduleList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    streamSubscription?.cancel();
  }

  getScheduleList() async {
    showLoading();
    final result = await Appclient.shared
        .getScheduleList(fromDate: fromDate, toDate: toDate);
    rxScheduleList(result ?? []);
    hideLoading();
  }

  setTag(int index) => tagIndex(index);
  switchFilter() => isFilter(!isFilter());
  setCurrentDay(int value) => currentDay(value);

  String getToday() {
    final dateFormat = DateFormat("dd/MM/yyyy");
    return dateFormat.format(DateTime.now());
  }

  String getWeekDay({int day}) {
    final dateFormat = DateFormat("dd/MM/yyyy");
    if (day != null) currentDate = currentDate.add(Duration(days: day));
    fromDate = dateFormat.format(getFirstDateOfTheWeek(currentDate));
    toDate = dateFormat.format(getLastDateOfTheWeek(currentDate));
    final firstDay = getFirstDateOfTheWeek(currentDate).day.toString();
    return "$firstDay - $toDate";
  }

  String getSectionDay(DateTime date) {
    final dateFormat = DateFormat("EEE dd/MM/yyyy", "vi");
    return dateFormat.format(date);
  }

  String getMonth({int day}) {
    if (day != null) {
      final newDay = day < 0
          ? getFirstDayOfMonth(currentDate).add(Duration(days: day))
          : getLastDayOfMonth(currentDate).add(Duration(days: day));
      currentDate = newDay;
    }
    final dateFormat = DateFormat("dd/MM/yyyy");
    fromDate = dateFormat.format(getFirstDayOfMonth(currentDate));
    toDate = dateFormat.format(getLastDayOfMonth(currentDate));
    return "${getFirstDayOfMonth(currentDate).month}-${getFirstDayOfMonth(currentDate).year}";
  }

  previousWeek() {
    rxWeekDay(getWeekDay(day: -7));
    getScheduleList();
  }

  nextWeek() {
    rxWeekDay(getWeekDay(day: 7));
    getScheduleList();
  }

  previousMonth() {
    rxWeekDay(getMonth(day: -1));
    calendarController.previousMonth();
    getScheduleList();
  }

  nextMonth() {
    rxWeekDay(getMonth(day: 1));
    calendarController.nextMonth();
    getScheduleList();
  }

  DateTime getFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  DateTime getLastDateOfTheWeek(DateTime dateTime) {
    return dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  DateTime getLastDayOfMonth(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month + 1, 0);
  }

  DateTime getFirstDayOfMonth(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, 1);
  }
}
