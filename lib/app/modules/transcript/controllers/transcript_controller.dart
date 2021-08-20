import 'package:get/get.dart';
import 'package:thanglong_university/app/model/transcript_model.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';

class TranscriptController extends GetxController {
  final count = 0.obs;
  final isFilter = false.obs;
  final rxTranscripts = RxList<TranscriptModel>();

  List<TranscriptModel> get transcriptsDC =>
      rxTranscripts.where((e) => e.subject.type == 'DC').toList();

  List<TranscriptModel> get transcriptsCN =>
      rxTranscripts.where((e) => e.subject.type == 'CN').toList();

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
