import 'package:flutter/material.dart';

import '../../../core/services/base_controller.dart';

class UpdateController extends BaseController {
  // RxBool isLoading = false.obs;
  TextEditingController userController =
      TextEditingController(text: "مايا شليل");
  TextEditingController numberController =
      TextEditingController(text: "رقم الهاتف");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
