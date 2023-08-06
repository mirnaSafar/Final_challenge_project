import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_ordering_application/app/my_app_controller.dart';
import 'package:food_ordering_application/core/data/repositories/shared_preference_repository.dart';
import 'package:food_ordering_application/core/enums/file_type.dart';
import 'package:food_ordering_application/core/enums/message_type.dart';
import 'package:food_ordering_application/core/services/cart_services.dart';
import 'package:food_ordering_application/core/services/connectivity_service.dart';
import 'package:food_ordering_application/core/services/notifacation_service.dart';
import 'package:food_ordering_application/ui/shared/colors.dart';
import 'package:food_ordering_application/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/enums/connectivity_status.dart';

bool isEmail(String value) {
  RegExp regExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(value);
}

bool isName(String name) {
  RegExp nameExp = RegExp(r'^[a-zA-Z\s]{2,15}$');
  return nameExp.hasMatch(name);
}

bool isValidNumber(String value) {
  RegExp regExp =
      RegExp(r'^(?:\+971|00971|0)?(?:50|51|52|55|56|2|3|4|6|7|9)\d{7}$');
  return regExp.hasMatch(value);
}

bool validPassword(String password) {
  RegExp passExp =
      RegExp(r'^(?=.*[^a-zA-Z\d\s])(?=.*[a-zA-Z])[@$!%*?&a-zA-Z\d]$');
  // return passExp.hasMatch(password);
  return true;
}

class FileTypeModel {
  FileTypeEnum type;
  String path;

  FileTypeModel(this.path, this.type);
}

double screenWidth(double percent) {
  return Get.size.width / percent;
}

double screenHeight(double percent) {
  return Get.size.height / percent;
}

SharedPreferenceRepository get storage =>
    Get.find<SharedPreferenceRepository>();

CartService get cartService => Get.find<CartService>();
NotificationService get notificationService => Get.find<NotificationService>();
ConnectivityService get connectivityService => Get.find<ConnectivityService>();

Future cLaunchUrl(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    CustomToast.showMessage(
        message: 'Cant lunch url', messageType: MessageType.REJECTED);
  }
}

void customLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: AppColors.mainBlackColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        width: screenWidth(4),
        height: screenWidth(4),
        child: SpinKitCircle(
          color: AppColors.mainOrangeColor,
          size: screenWidth(8),
        ),
      );
    });

double get taxAmount => 0.18;

double get deliverAmount => 0.1;

bool get isOnline =>
    Get.find<MyAppController>().connectivityStatus == ConnectivityStatus.ONLINE;

bool get isOffline =>
    Get.find<MyAppController>().connectivityStatus ==
    ConnectivityStatus.OFFLINE;

void checkConnection(Function function) {
  if (isOnline) {
    function();
  } else {
    showNoConnectionMessage();
  }
}

void showNoConnectionMessage() {
  CustomToast.showMessage(
      message: 'Please check internet connection',
      messageType: MessageType.WARNING);
}
