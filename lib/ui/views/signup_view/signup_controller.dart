import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/college_model.dart';
import 'package:flutter_templete/core/data/reposotories/college_repository.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

import '../../../core/data/reposotories/user_repository.dart';

class SignUpViewController extends BaseController {
  @override
  void onInit() {
    getAllColleges();

    super.onInit();
  }

  RxList<CollegeModel> allColleges = <CollegeModel>[].obs;
  RxString selectedValue = "".obs;
  RxString selectedMajor = ''.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController =
      TextEditingController(text: 'mirna');
  TextEditingController phoneNumberController =
      TextEditingController(text: '0987655432');

  getAllColleges() {
    runLoadingFutureFunction(
        function: CollegeRepository().getAllColleges().then((value) =>
            value.fold((l) => CustomToast.showMessage(message: l),
                (r) => allColleges.addAll(r))));
  }

  submitForm(
      {required String collage_id,
      required String name,
      required String phone}) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      runLoadingFutureFunction(
          function: UserRepository()
              .register(collage_id: collage_id, name: name, phone: phone)
              .then((value) => value.fold(
                  (l) => CustomToast.showMessage(message: l),
                  (r) => {
                        storage.saveUserInfo(r),
                        Get.to(MainView()),
                      })));
    }
  }
}
