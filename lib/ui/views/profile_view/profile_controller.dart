import 'package:flutter/material.dart';

import '../../../core/services/base_controller.dart';

class ProfileController extends BaseController {
  // RxBool isLoading = false.obs;
  TextEditingController personalController = TextEditingController();
  TextEditingController sendController = TextEditingController();
  TextEditingController appController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
