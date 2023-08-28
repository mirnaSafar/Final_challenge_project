import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/core/data/models/college_model.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/extensions.dart';
import 'package:flutter_templete/ui/views/home_view.dart/home_view_controller.dart';
import 'package:flutter_templete/ui/views/home_view.dart/home_view_widgets/major_subjects.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_controller.dart';
import 'package:flutter_templete/ui/views/signup_view/signup_controller.dart';
import 'package:get/get.dart';

import '../../../shared/custom_widgets/custom_underline.dart';
import '../../../shared/utils.dart';

class MajorCategories extends StatefulWidget {
  const MajorCategories({super.key, required this.majors});
  final List<CollegeModel> majors;

  @override
  State<MajorCategories> createState() => _MajorCategoriesState();
}

class _MajorCategoriesState extends State<MajorCategories> {
  HomeViewController controller = Get.put(HomeViewController());
  MainViewController mainViewController = Get.put(MainViewController());

  SignUpViewController signUpViewController = Get.put(SignUpViewController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print(controller.currentMajorIndex.value);

      return
          // controller.currentMajorIndex.value == -1
          //     ?
          Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
              ),
              itemCount: widget.majors.length - widget.majors.length % 4,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    // controller.currentMajorIndex.value = index;
                  },
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          width: screenWidth(4),
                          height: screenWidth(4),
                          child: SvgPicture.asset(
                            widget.majors[index].image ?? '',
                          ),
                        ),
                        Text(widget.majors[index].name ?? ''),
                        10.ph,
                        Visibility(
                            visible: signUpViewController.selectedMajor.value ==
                                widget.majors[index].name,
                            // controller.currentMajorIndex.value == index,
                            child: CustomUnderline(
                              width: screenWidth(4),
                              height: 5,
                            ))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          widget.majors.length % 4 != 0
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth(10)),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: widget.majors.length % 4,
                        childAspectRatio: 1.2),
                    itemCount: widget.majors.length % 4,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          controller.getCollegeSubjects(
                              collegeID: widget.majors[index].uuid);
                          // signUpViewController.selectedMajor.value =
                          //     widget.majors[(widget.majors.length -
                          //             widget.majors.length % 4) +
                          //         index];
                          // controller.currentMajorIndex.value =
                          //     (widget.majors.length -
                          //             widget.majors.length % 4) +
                          //         index;
                          context.push(MajorSubjects(
                              major: widget.majors[index].name ?? ''));
                          // majorSubjects(widget.majors[index].name??'');
                        },
                        child: Container(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                  width: screenWidth(4.5),
                                  height: screenWidth(4.5),
                                  child: SvgPicture.asset(widget
                                          .majors[(widget.majors.length -
                                                  widget.majors.length % 4) +
                                              index]
                                          .image ??
                                      '')),
                              Text(widget
                                      .majors[(widget.majors.length -
                                              widget.majors.length % 4) +
                                          index]
                                      .name ??
                                  ''),
                              10.ph,
                              Visibility(
                                  visible: signUpViewController
                                          .selectedMajor.value ==
                                      widget
                                          .majors[(widget.majors.length -
                                                  widget.majors.length % 4) +
                                              index]
                                          .name,
                                  // visible: controller.currentMajorIndex.value ==
                                  //     (widget.majors.length -
                                  //             widget.majors.length % 4) +
                                  //         index,
                                  child: CustomUnderline(
                                    width: screenWidth(3),
                                    height: 5,
                                  ))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: "ماستر",
                  height: screenHeight(16),
                  width: screenWidth(6),
                  onPressed: () {
                    mainViewController.pageHeaderColor.value =
                        AppColors.mainPurpleColore;

                    context.push(MajorSubjects(
                        major: signUpViewController.selectedMajor.value));
                    controller.showSubjects.value = true;
                  },
                ),
                30.px,
                CustomButton(
                  text: "تخرج",
                  width: screenWidth(6),
                  textColor: AppColors.mainGreyColor,
                  height: screenHeight(16),
                  color: AppColors.mainBlueColor,
                  onPressed: () {
                    mainViewController.pageTitle.value =
                        signUpViewController.selectedMajor.value;
                    mainViewController.pageHeaderColor.value =
                        AppColors.mainBlueColor;

                    context.push(MajorSubjects(
                        major: signUpViewController.selectedMajor.value));
                    controller.showSubjects.value = true;
                  },
                ),
              ],
            ),
          )
        ],
      );
      // : majorSubjects(
      //     widget.majors[controller.currentMajorIndex.value].name??'');
    });
  }
}
