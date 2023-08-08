import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/views/favorites_view.dart/favorites_view.dart';
import 'package:flutter_templete/ui/views/home_view.dart/home_view.dart';
import 'package:flutter_templete/ui/views/notification_view.dart/notification_view.dart';
import 'package:flutter_templete/ui/views/profile_view/profile_view.dart';

import '../../../core/enums/bottom_Navigation.dart';
import '../../shared/colors.dart';
import '../../shared/utils.dart';
import 'main_view_widgets/bottom_navigation_widget.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  BottomNavigationEnum selected = BottomNavigationEnum.HOME;
  PageController pageController = PageController(initialPage: 1);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // MainViewController controller = Get.put(MainViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhiteColor,
      key: scaffoldKey,
      endDrawer: Container(
        color: AppColors.mainWhiteColor,
        width: screenWidth(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('option 1'),
            Text('option 2'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        bottomNavigationEnum: selected,
        onTap: (selectedEnum, pageNumber) {
          // scaffoldKey.currentState!.openDrawer();
          pageController.animateToPage(pageNumber,
              duration: const Duration(
                milliseconds: 100,
              ),
              curve: Curves.easeInCirc);
          setState(() {
            selected = selectedEnum;
          });
        },
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (pageNumer) {},
        children: const [
          NotificationView(),
          HomeView(),
          FavoritesView(),
          ProfileView()
        ],
      ),
    );
  }
}
