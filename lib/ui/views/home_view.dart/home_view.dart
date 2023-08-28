import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/extensions.dart';
import 'package:flutter_templete/ui/views/home_view.dart/home_view_widgets/home_top_section.dart';
import 'package:flutter_templete/ui/views/home_view.dart/home_view_widgets/major_categories.dart';
import 'package:get/get.dart';

import '../../shared/colors.dart';
import '../../shared/utils.dart';
import '../signup_view/signup_controller.dart';
import 'home_view_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewController controller = Get.put(HomeViewController());
  SignUpViewController signUpViewController = Get.put(SignUpViewController());
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: TickerProviderImpl(), length: 3);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Map<String,dynamic> question={"id":}
    List<Map<String, dynamic>> majors = [
      {
        'major': "طب بشري",
        'image': "assets/images/Login.svg",
      },
      {
        'major': "طب اسنان",
        'image': "assets/images/Login.svg",
      },
      {
        'major': " صيدلة",
        'image': "assets/images/Login.svg",
      },
      {
        'major': " تمريض",
        'image': "assets/images/Login.svg",
      },
      {
        'major': " هندسة معلوماتية",
        'image': "assets/images/Login.svg",
      },
      {
        'major': "هندسة معمارية",
        'image': "assets/images/Login.svg",
      }
    ];
    List<Map<String, dynamic>> medical = [
      {
        'major': "طب بشري",
        'image': "assets/images/Login.svg",
      },
      {
        'major': "طب اسنان",
        'image': "assets/images/Login.svg",
      },
      {
        'major': " صيدلة",
        'image': "assets/images/Login.svg",
      },
      {
        'major': " تمريض",
        'image': "assets/images/Login.svg",
      },
    ];
    List<Map<String, dynamic>> engineering = [
      {
        'major': " هندسة معلوماتية",
        'image': "assets/images/Login.svg",
      },
      {
        'major': "هندسة معمارية",
        'image': "assets/images/Login.svg",
      }
    ];

    return Obx(() {
      print(controller.currentIndex);
      return DefaultTabController(
          length: 3,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: screenWidth(30), vertical: 0),
            child: ListView(
              children: [
                screenHeight(8).ph,

                HomeTopSection(),

                Visibility(
                  // visible: !controller.showSubjects.value,
                  child: Column(
                    children: [
                      TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          // indicatorWeight: 12,

                          unselectedLabelColor: AppColors.mainGreyColor,
                          labelColor: AppColors.babyBlueColor,
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                                width: 3, color: AppColors.babyBlueColor),
                          ),
                          isScrollable: true,
                          indicatorPadding: EdgeInsets.only(left: 22),
                          // labelPadding: EdgeInsets.symmetric(horizontal: 22),
                          controller: _tabController,
                          tabs: [
                            Padding(
                              padding: EdgeInsets.only(left: 22),
                              child: Tab(
                                text: 'الكل',
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 22),
                                child: Tab(text: 'الكليات الهندسية')),
                            Padding(
                              padding: EdgeInsets.only(left: 22),
                              child: Tab(
                                text: 'الكليات الطبية',
                              ),
                            ),
                          ]),
                      10.ph,
                      SizedBox(
                        height: screenHeight(2),
                        child: TabBarView(
                            controller: _tabController,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              MajorCategories(
                                  majors: controller.allColleges.value),
                              MajorCategories(
                                  majors: controller.engColleges.value),
                              MajorCategories(majors: controller.medColleges)
                            ]),
                      )
                    ],
                  ),
                ),

                // Obx(
                //   () => Visibility(
                //       visible: controller.showSubjects.value,
                //       child: majorSubjects(
                //           signUpViewController.selectedMajor.value)),
                // ),
              ],
            ),
          ));
    });
  }
}
