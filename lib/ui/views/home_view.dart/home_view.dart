import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/user_input.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_widgets/page_header.dart';
import 'package:get/get.dart';

import '../../shared/colors.dart';
import 'home_view_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewController controller = Get.put(HomeViewController());
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PageHeader(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(30)),
          child: Column(
            children: [
              UserInput(
                controller: controller.searchController,
                text: "يحث",
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_alt_outlined),
              )
            ],
          ),
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
                onTap: (position) => controller.currentIndex.value = position,
                dotsCount: 3,
                position: controller.currentIndex.value,
                decorator: DotsDecorator(
                    color: AppColors.mainWhiteColor,
                    shape: Border.all(color: AppColors.mainPurpleColore),
                    activeShape: Border.all(color: AppColors.mainPurpleColore),
                    activeColor: AppColors.mainPurpleColore),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
