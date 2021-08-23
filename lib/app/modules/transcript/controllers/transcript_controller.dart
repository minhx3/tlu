import 'package:get/get.dart';
import 'package:thanglong_university/app/model/score_detail_entity.dart';
import 'package:thanglong_university/app/model/transcript_model.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';

class TranscriptController extends GetxController {
  final count = 0.obs;
  final isFilter = false.obs;
  final rxTranscripts = RxList<TranscriptModel>();
  final rxScore = RxList<ScoreDetailEntity>();

  List<TranscriptModel> get transcriptsDC {
    List<TranscriptModel> res =
        rxTranscripts.where((e) => e.subject.type == 'DC').toList();

    if (isFilter.isTrue) {
      res = res..sort((a, b) => b.gpa.compareTo(a.gpa));
    }
    return res;
  }

  List<TranscriptModel> get transcriptsCN {
    List<TranscriptModel> res =
        rxTranscripts.where((e) => e.subject.type == 'CN').toList();

    if (isFilter.isTrue) {
      res = res..sort((a, b) => b.gpa.compareTo(a.gpa));
    }
    return res;
  }

  @override
  void onInit() {
    super.onInit();
    getTranscriptsList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  setFilter(bool value) => isFilter(value);

  getTranscriptsList() async {
    try {
      var res = await Appclient.shared.getTranscriptsList();
      if (res != null) {
        rxTranscripts(res);
      }
    } on Exception catch (e) {} finally {}
  }

}
