import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/view_state.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';

class AppController extends GetxController {
  final rxViewState = ViewState.idle.obs;
  viewWith(ViewState viewState) => rxViewState(viewState);

  changeLanguage(String locale) {
    Storage.setLanguage(locale);
    Get.updateLocale(Locale(locale));
  }

  String getLanguage() => Storage.getLanguage();

  showLoading() => rxViewState(ViewState.loading);
  hideLoading() => rxViewState(ViewState.idle);
}
