import 'package:flutter/material.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class SignUpViewController extends BaseController {
  RxInt selectedValue = 1.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  submitForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // runFullLoadingFutureFunction(function: () {});
      Get.to(MainView());
    }
  }
}
