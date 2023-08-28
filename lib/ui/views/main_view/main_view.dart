import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/favorites_view.dart/favorites_view.dart';
import 'package:flutter_templete/ui/views/home_view.dart/home_view.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_widgets/page_header.dart';
import 'package:flutter_templete/ui/views/notification_view.dart/notification_view.dart';
import 'package:flutter_templete/ui/views/profile_view/profile_view.dart';
import 'package:get/get.dart';

import '../../shared/colors.dart';
import 'main_view_widgets/bottom_navigation_widget.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  // MainViewControllermainViewController = Get.put(MainViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhiteColor,
      key: mainViewController.scaffoldKey,
      bottomNavigationBar: Obx(
        () => BottomNavigationWidget(
          bottomNavigationEnum: mainViewController.selected.value,
          onTap: (selectedEnum, pageNumber) {
            mainViewController.pageController.animateToPage(pageNumber,
                duration: const Duration(
                  milliseconds: 100,
                ),
                curve: Curves.easeInCirc);
            mainViewController.setSelectedEnum(selectedEnum);
          },
        ),
      ),
      // appBar: PageHeader(),
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: mainViewController.pageController,
            onPageChanged: (pageNumer) {},
            children: const [
              NotificationView(),
              HomeView(),
              FavoritesView(),
              ProfileView()
            ],
          ),
          PageHeader(),
        ],
      ),
    );
  }
}
