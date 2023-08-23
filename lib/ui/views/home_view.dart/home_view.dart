import 'package:bot_toast/bot_toast.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../shared/colors.dart';
import '../../shared/custom_widgets/user_input.dart';
import '../../shared/utils.dart';
import 'home_view_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewController controller = Get.put(HomeViewController());
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: TickerProviderImpl(), length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(30)),
          child: Column(
            children: [
              UserInput(
                controller: controller.searchController,
                fillColor: AppColors.searchfieldColor,
                text: "يحث",
                prefixIcon: Transform.scale(
                    scale: 0.4,
                    child: SvgPicture.asset('assets/images/ic_search.svg')),
              ),
              30.ph,
              Obx(
                () => Column(children: [
                  SvgPicture.asset(
                    'assets/images/intro1.svg',
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: DotsIndicator(
                      onTap: (position) =>
                          controller.currentIndex.value = position,
                      dotsCount: 3,
                      position: controller.currentIndex.value,
                      decorator: DotsDecorator(
                          size: Size(7, 6),
                          activeSize: Size(7, 6),
                          color: AppColors.mainWhiteColor,
                          shape: Border.all(color: AppColors.mainPurpleColore),
                          activeShape:
                              Border.all(color: AppColors.mainPurpleColore),
                          activeColor: AppColors.mainPurpleColore),
                    ),
                  ),
                ]),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: BorderDirectional(
                      start: BorderSide(color: AppColors.mainGreyColor),
                    )),
                    child: CustomText(
                      text: 'التصنيفات',
                      textColor: AppColors.mainGreyColor,
                    ),
                  ),
                ],
              ),
              TabBar(
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2),
                  ),
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 40),
                  controller: _tabController,
                  tabs: [
                    Tab(
                        child: CustomText(
                      text: 'الكل',
                      fontSize: 13,
                    )),
                    Tab(
                        child:
                            CustomText(text: 'الكليات الهندسية', fontSize: 13)),
                    Tab(
                        child:
                            CustomText(text: 'الكليات الطبية', fontSize: 13)),
                  ]),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  Text('data'),
                  Text('data'),
                  Text('data'),
                ]),
              )
            ],
          ),
        ));
  }
}
