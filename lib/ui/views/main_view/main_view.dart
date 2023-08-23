import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/views/favorites_view.dart/favorites_view.dart';
import 'package:flutter_templete/ui/views/home_view.dart/home_view.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_widgets/page_header.dart';
import 'package:flutter_templete/ui/views/notification_view.dart/notification_view.dart';
import 'package:flutter_templete/ui/views/profile_view/profile_view.dart';
import 'package:get/get.dart';

import '../../shared/colors.dart';
import '../../shared/utils.dart';
import 'main_view_controller.dart';
import 'main_view_widgets/bottom_navigation_widget.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainViewController controller = Get.put(MainViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhiteColor,
      key: controller.scaffoldKey,
      bottomNavigationBar: Obx(
        () => BottomNavigationWidget(
          bottomNavigationEnum: controller.selected.value,
          onTap: (selectedEnum, pageNumber) {
            controller.pageController.animateToPage(pageNumber,
                duration: const Duration(
                  milliseconds: 100,
                ),
                curve: Curves.easeInCirc);
            controller.setSelectedEnum(selectedEnum);
          },
        ),
      ),
      body: Column(
        children: [
          PageHeader(),
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: screenHeight(1),
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    onPageChanged: (pageNumer) {},
                    children: const [
                      NotificationView(),
                      HomeView(),
                      FavoritesView(),
                      ProfileView()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
