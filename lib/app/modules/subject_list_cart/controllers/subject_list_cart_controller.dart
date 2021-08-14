import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/base/app_controller.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/model/subject_cart.model.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';

class SubjectListCartController extends AppController {
  final rxSubjectCart = Rx<SubjectCartModel>();
  final rxEditMode = false.obs;

  @override
  void onInit() {
    getSubjectCart();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getSubjectCart() async {
    final result = await Appclient.shared.getSubjectsCart();
    if (result?.statusCode == 200) {
      rxSubjectCart(SubjectCartModel.fromJson(result.data));
      update();
    }
  }

  confirmAddToCart(RegisterSubjectEntity subject) {
    return showConfirmDialog(
        actions: Row(
          children: [
            SizedBox(
              width: 150,
              child: ButtonView(
                backgroundColor: AppColor.c000333,
                title: "Hủy",
                onTap: () {
                  Navigator.of(Get.context).pop();
                },
              ),
            ),
            SizedBox(width: 5),
            SizedBox(
              width: 150,
              child: ButtonView(
                title: "Xác nhận",
                onTap: () {
                  this.addSubjectToCart(subject.id);
                },
              ),
            ),
          ],
        ),
        messageWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Bạn có chắc chắn muốn thêm vào danh sách lớp",
              style: TextStyle(color: AppColor.c4d4d4d, fontSize: 12),
            ),
            SizedBox(height: 2),
            Text(
              "${subject.name ?? subject?.subject?.name} - ${subject.getAllTime} ?",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.c4d4d4d,
                  fontSize: 12),
            )
          ],
        ),
        titleWidget: RichText(
          text: TextSpan(
            text: 'Xác nhận ',
            style: TextStyle(
                color: AppColor.c000333,
                fontWeight: FontWeight.w600,
                fontSize: 16),
            children: const <TextSpan>[
              TextSpan(
                  text: 'Thêm danh sách',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColor.c5ccc78)),
            ],
          ),
        ));
  }

  confirmRemoveCart(RegisterSubjectEntity subject) {
    showConfirmDialog(
        actions: Row(
          children: [
            SizedBox(
              width: 150,
              child: ButtonView(
                backgroundColor: AppColor.c000333,
                title: "Hủy",
                onTap: () {
                  Navigator.of(Get.context).pop();
                },
              ),
            ),
            SizedBox(width: 5),
            SizedBox(
              width: 150,
              child: ButtonView(
                title: "Xác nhận",
                onTap: () {
                  deleteSubjectFromCart(subject.id);
                },
              ),
            ),
          ],
        ),
        messageWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Bạn có chắc chắn muốn hủy lớp",
              style: TextStyle(color: AppColor.c4d4d4d, fontSize: 12),
            ),
            SizedBox(height: 2),
            Text(
              "${subject.name} - ${subject.getAllTime} ?",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.c4d4d4d,
                  fontSize: 12),
            )
          ],
        ),
        titleWidget: RichText(
          text: TextSpan(
            text: 'Xác nhận ',
            style: TextStyle(
                color: AppColor.c000333,
                fontWeight: FontWeight.w600,
                fontSize: 16),
            children: const <TextSpan>[
              TextSpan(
                  text: 'Hủy lớp',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColor.c5ccc78)),
            ],
          ),
        ));
  }

  Future<int> addSubjectToCart(String subjectClassId) async {
    final result = await Appclient.shared.addSubjectToCart(subjectClassId);
    if (result?.statusCode == 200) {
      showMessage(
              titleWidget: RichText(
                text: TextSpan(
                  text: 'Thêm danh sách ',
                  style: TextStyle(
                      color: AppColor.c000333,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Thành công',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColor.c5ccc78)),
                  ],
                ),
              ),
              message: result?.message)
          .then((exit) {
        getSubjectCart();
        return null;
      });
    } else {
      showErrorMessage(
              titleWidget: RichText(
                text: TextSpan(
                  text: 'Thêm danh sách ',
                  style: TextStyle(
                      color: AppColor.c000333,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'thất bại',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColor.cfc7171)),
                  ],
                ),
              ),
              message: result?.errorReason)
          .then((exit) {
        return null;
      });
    }
    return result?.statusCode;
  }

  Future<int> deleteSubjectFromCart(String subjectClassId) async {
    final result = await Appclient.shared.deleteSubjectFromCart(subjectClassId);
    if (result?.statusCode == 200) {
      getSubjectCart();
    } else {
      showErrorMessage(title: "Xóa thất bại", message: result?.errorReason);
    }
    return result?.statusCode;
  }

  void changeEditMode() {
    rxEditMode(!rxEditMode());
    update();
  }
}
