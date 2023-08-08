import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../core/enums/bottom_Navigation.dart';
import '../../../core/services/base_controller.dart';
import '../../shared/utils.dart';

class MainViewController extends BaseController {
  BottomNavigationEnum selected = BottomNavigationEnum.HOME;
  PageController pageController = PageController(initialPage: 2);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  void setSelectedEnum(BottomNavigationEnum selectedEnum) {
    selected = selectedEnum;
  }

  RxInt notificationCounter = 0.obs;

  changeNotificationCounter() {
    notificationService.notifcationStream.stream
        .asBroadcastStream()
        .listen((event) {
      notificationCounter.value += 1;
    });
  }
}
