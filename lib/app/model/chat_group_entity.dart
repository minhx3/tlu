import 'package:thanglong_university/generated/json/base/json_convert_content.dart';

class ChatGroupEntity with JsonConvert<ChatGroupEntity> {
  String id;
  String name;
  String sbId;

  ChatGroupEntity({this.id, this.name, this.sbId});
}
