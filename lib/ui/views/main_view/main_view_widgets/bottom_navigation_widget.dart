import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_underline.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_controller.dart';
import 'package:get/get.dart';

import '../../../../core/enums/bottom_Navigation.dart';
import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_text.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum bottomNavigationEnum;
  final Function(BottomNavigationEnum, int) onTap;

  const BottomNavigationWidget(
      {Key? key, required this.bottomNavigationEnum, required this.onTap})
      : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    MainViewController controller = Get.put(MainViewController());
    final size = MediaQuery.of(context).size;
    return Stack(
        // fit: StackFit.loose,
        alignment: Alignment.center,
        children: [
          Container(
            width: size.width,
            height: size.height * 0.09,
            color: AppColors.mainWhiteColor,
          ),
          Positioned(
            // bottom: size.height * 0.00,
            left: 20,
            right: 20,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  navItem(
                      imageName: 'ic_profile',
                      text: ' ',
                      isSelected: widget.bottomNavigationEnum ==
                          BottomNavigationEnum.PROFILE,
                      onTap: () {
                        widget.onTap(BottomNavigationEnum.PROFILE, 3);
                      },
                      size: size),
                  navItem(
                      imageName: 'ic_star',
                      text: ' ',
                      isSelected: widget.bottomNavigationEnum ==
                          BottomNavigationEnum.FAVORITES,
                      onTap: () {
                        widget.onTap(BottomNavigationEnum.FAVORITES, 2);
                      },
                      size: size),
                  navItem(
                      imageName: 'ic_home',
                      text: ' ',
                      isSelected: widget.bottomNavigationEnum ==
                          BottomNavigationEnum.HOME,
                      onTap: () {
                        widget.onTap(BottomNavigationEnum.HOME, 1);
                      },
                      size: size),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      navItem(
                          imageName: 'ic_notification',
                          text: ' ',
                          isSelected: widget.bottomNavigationEnum ==
                              BottomNavigationEnum.NOTIFICATION,
                          onTap: () {
                            widget.onTap(BottomNavigationEnum.NOTIFICATION, 0);
                          },
                          size: size),
                      Visibility(
                        visible: controller.notificationCounter.value != 0,
                        child: Positioned(
                          bottom: 24,
                          right: -3,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: AppColors.mainRedColor,
                            child: Obx(
                              () => CustomText(
                                text: '6',
                                textColor: AppColors.mainWhiteColor,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]);
  }

  Widget navItem({
    required String imageName,
    required String text,
    required bool isSelected,
    required Function() onTap,
    required Size size,
  }) {
    return SizedBox(
      width: size.width * 0.15,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/$imageName.svg',
              color: AppColors.mainPurpleColore,
              // width: size.width * 0.09,
              height: size.width * 0.05,
            ),
            5.ph,
            Visibility(
              visible: isSelected,
              child: CustomUnderline(),
            ),
            SizedBox(
              height: size.width * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
