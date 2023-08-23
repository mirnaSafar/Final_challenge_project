import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../core/enums/bottom_Navigation.dart';
import '../../../core/services/base_controller.dart';
import '../../shared/utils.dart';

class MainViewController extends BaseController {
  Rx<BottomNavigationEnum> selected = BottomNavigationEnum.HOME.obs;
  PageController pageController = PageController(initialPage: 2);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxString pageTitle = "الرئيسية".obs;
  RxInt notificationCounter = 0.obs;
  RxString pageHeaderIcon = 'assets/images/ic_back.svg'.obs;

  void setSelectedEnum(BottomNavigationEnum selectedEnum) {
    selected.value = selectedEnum;
    switch (selectedEnum) {
      case BottomNavigationEnum.NOTIFICATION:
        pageTitle.value = 'الإشعارات';
        pageHeaderIcon.value = 'assets/images/ic_back.svg';

        break;
      case BottomNavigationEnum.HOME:
        pageTitle.value = 'الرئيسية';
        pageHeaderIcon.value = 'assets/images/ic_home.svg';

        break;
      case BottomNavigationEnum.FAVORITES:
        pageTitle.value = 'الأسئلة المهمة';
        pageHeaderIcon.value = 'assets/images/ic_back.svg';

        break;
      case BottomNavigationEnum.PROFILE:
        pageTitle.value = 'الملف الشخصي';
        pageHeaderIcon.value = 'assets/images/ic_user.svg';

        break;
    }
  }

  changeNotificationCounter() {
    notificationService.notifcationStream.stream
        .asBroadcastStream()
        .listen((event) {
      notificationCounter.value += 1;
    });
  }
}
