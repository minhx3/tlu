import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thanglong_university/app/configuration/constant/constant.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    GetStorage.init().then((state) {

      if (Storage?.getLanguage() != null) {
        changeLanguage(Storage?.getLanguage());
      } else {
        changeLanguage(Constant.defautLocale);
      }
    });
  }
}
