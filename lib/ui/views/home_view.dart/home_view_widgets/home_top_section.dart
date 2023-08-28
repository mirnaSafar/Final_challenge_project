import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/main.dart';
import 'package:get/get.dart';

import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_text.dart';
import '../../../shared/custom_widgets/user_input.dart';
import '../../signup_view/signup_controller.dart';
import '../home_view_controller.dart';

class HomeTopSection extends StatefulWidget {
  const HomeTopSection({super.key});

  @override
  State<HomeTopSection> createState() => _HomeTopSectionState();
}

class _HomeTopSectionState extends State<HomeTopSection> {
  HomeViewController controller = Get.put(HomeViewController());
  SignUpViewController signUpViewController = Get.put(SignUpViewController());

  @override
  Widget build(BuildContext context) {
    return Column(
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
                onTap: (position) => controller.currentIndex.value = position,
                dotsCount: 3,
                position: controller.currentIndex.value,
                decorator: DotsDecorator(
                    size: Size(7, 6),
                    activeSize: Size(7, 6),
                    color: AppColors.mainWhiteColor,
                    shape: Border.all(color: AppColors.mainPurpleColore),
                    activeShape: Border.all(color: AppColors.mainPurpleColore),
                    activeColor: AppColors.mainPurpleColore),
              ),
            ),
          ]),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                controller.currentMajorIndex.value = -1;
              },
              child: InkWell(
                onTap: controller.showSubjects.value
                    ? () {
                        controller.showSubjects.value = false;
                      }
                    : null,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                    start: BorderSide(color: AppColors.mainGreyColor),
                  )),
                  child: CustomText(
                    text: 'التصنيفات',
                    textColor: AppColors.mainGreyColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
