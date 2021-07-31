import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/base/app_controller.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/subject_cart.model.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';

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
  void onClose() {}

  getSubjectCart() async {
    final result = await Appclient.shared.getSubjectsCart();
    if (result?.statusCode == 200) {
      rxSubjectCart(SubjectCartModel.fromJson(result.data));
      update();
    }
  }

  Future<int> addSubjectToCart(String subjectClassId) async {
    final result = await Appclient.shared.addSubjectToCart(subjectClassId);
    if (result?.statusCode == 200) {
      getSubjectCart();
    } else {
      showErrorMessage(
          title: "Thêm danh sách thất bại", message: result?.errorReason);
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
