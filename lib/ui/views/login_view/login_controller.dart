import 'package:flutter/material.dart';

import '../../../core/services/base_controller.dart';

class LoginController extends BaseController {
  // RxBool isLoading = false.obs;
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // void login() {
  //   // isLoading.value = true;
  //   runFullLoadingFutureFunction(
  //       function: UserRepository()
  //           .login(email: userController.text, password: passController.text)
  //           .then((value) {
  //     value.fold((l) {
  //       isLoading.value = false;

  //       CustomToast.showMessage(messageType: MessageType.REJECTED, message: l);
  //     }, (r) {
  //       storage.setTokenInfo(r);
  //       //SharedPrefrenceRepository.setLoggedIn(true);
  //       Get.off(const MainView());
  //     });
  //   }));
  //   // : isLoading.value = fals e;
  // }
}
