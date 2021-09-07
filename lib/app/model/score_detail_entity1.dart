import 'package:thanglong_university/generated/json/base/json_convert_content.dart';

class ScoreDetailEntity1 with JsonConvert<ScoreDetailEntity1> {
  List<ScoreDetailListScoreDetail> listScoreDetail;
  String scoreName;

  String get scoreAvg {
    var res = listScoreDetail.map((e) => e.scoreSkill).reduce((a, b) => a + b) /
        listScoreDetail.length;
    return res.toString();
  }
}

class ScoreDetailListScoreDetail with JsonConvert<ScoreDetailListScoreDetail> {
  int scoreSkill;
  String skill;
}
