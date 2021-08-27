import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/base/app_controller.dart';
import 'package:thanglong_university/app/model/news_model.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';

class DetailNewController extends AppController {
  final Rx<NewsModel> rxNews = new Rx<NewsModel>();
  String newsId = Get.arguments["id"];

  @override
  void onInit() {
    super.onInit();
    getDetail();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getDetail() async {
    showLoading();
    rxNews(await Appclient.shared
        .getNewDetail(newsId)
        .whenComplete(() => hideLoading()));
  }
}
