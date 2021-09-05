import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/model/chat/subject_class_entity.dart';
import 'package:thanglong_university/app/model/chat/user_entity.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';
import 'package:tiengviet/tiengviet.dart';

class ChatGroupInfoController extends GetxController {
  final TextEditingController searchCtrl = TextEditingController();
  RxList<UserEntity> u = RxList();
  RxList<UserEntity> uf = RxList();

  @override
  void onInit() {
    super.onInit();

    searchCtrl.addListener(() {
      filterList();
    });
    getListUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    searchCtrl.dispose();
  }

  void getListUser() async {
    SubjectClassEntity cg = Get.arguments;
    List<UserEntity> res = await Appclient.shared.getUserList(cg.id);
    UserEntity tec = UserEntity(
        id: cg.teacher?.id,
        isTeacher: true,
        name: cg.teacher.fullName,
        mobile: cg.teacher.mobile,
        email: cg.teacher.email,
        avatar: cg.teacher.avatar,
        faculty: cg.teacher.faculty,
        teachingList: cg.teacher.teachingList);
    u([tec, ...res]);
    uf([tec, ...res]);
  }

  filterList() {
    String keyword = searchCtrl.text;
    if (u.isEmpty) return;

    if (keyword.isEmpty) {
      uf(u);
    }

    String search = TiengViet.parse(keyword).toLowerCase();
    var data = u.where((trans) {
      String title = TiengViet.parse(trans.name).toLowerCase();
      return title.contains(search);
    }).toList();

    uf(data);
  }
}
