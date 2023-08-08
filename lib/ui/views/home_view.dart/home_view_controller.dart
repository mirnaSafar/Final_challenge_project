import 'package:flutter/material.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HomeViewController extends BaseController {
  RxDouble currentIndex = 0.0.obs;

  // String get getDotsStatusText => currentIndex.value != 2 ? 'Next' : 'Finish';
  TextEditingController searchController = TextEditingController();

  void monitorDotsState() {
    // currentIndex.value != 2 ? currentIndex += 1 : null;
  }
}
