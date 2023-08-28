import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:get/get.dart';

import '../main_view/main_view_widgets/page_header.dart';

class SubjectTestView extends StatefulWidget {
  const SubjectTestView({super.key});

  @override
  State<SubjectTestView> createState() => _SubjectTestViewState();
}

class _SubjectTestViewState extends State<SubjectTestView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // int index = mainViewController.pageTitle.value.lastIndexOf('/');

        // mainViewController.pageTitle.value =
        //     // mainViewController.pageTitle.value
        //     mainViewController.pageTitle.value.substring(0, index);
        // mainViewController.pageHeaderIcon.value = 'assets/images/ic_back.svg';

        return Future(() => true);
      },
      child: Obx(
        () => Scaffold(
          backgroundColor: AppColors.mainWhiteColor,
          appBar: PageHeader(),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 0,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    homeViewController.progressFactor.value,
                    style: TextStyle(fontSize: 14),
                  ),
                  10.ph,
                  LinearProgressIndicator(
                    minHeight: 5,
                    backgroundColor: AppColors.mainBlueColor,
                    color: AppColors.mainPurpleColore,
                    value: (homeViewController.currentQuestion.value + 1) /
                        homeViewController.totalQuestions.value,
                  ),
                  30.ph,
                  CustomText(
                      textColor: AppColors.mainGreyColor,
                      fontSize: 14,
                      text: homeViewController.bookQuestions[0].textQuestions!
                      // '25. الخدمة بأفضل جهد في بروتوكول الانترنت IPV4 تعني ان :'
                      ),
                  20.ph,
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    //  homeViewController
                    //                 .bookQuestions[0].answers.,
                    separatorBuilder: (BuildContext context, int index) {
                      return 10.ph;
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.mainGreyColor),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(children: [
                          Radio(
                            activeColor: AppColors.mainGreyColor,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: index,
                            groupValue: homeViewController.selected,
                            onChanged: (value) {
                              setState(() {
                                homeViewController.selected = index;
                              });
                            },
                            // visualDensity: VisualDensity(horizontal: 0),
                          ),
                          Expanded(
                            child: CustomText(
                                textColor: AppColors.mainGreyColor,
                                fontSize: 14,
                                text: homeViewController
                                    .bookQuestions[0].answers!.s1!),
                          )
                        ]),
                      );
                    },
                  ),
                  10.ph,
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/check.svg'),
                      15.px,
                      SvgPicture.asset('assets/images/book_mark.svg'),
                      15.px,
                      SvgPicture.asset('assets/images/star.svg'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        width: screenWidth(5),
                        onPressed: () => homeViewController.decreaseProgress(),
                        text: 'السابق',
                        borderColor: AppColors.mainPurpleColore,
                        textColor: AppColors.mainPurpleColore,
                        color: AppColors.mainWhiteColor,
                      ),
                      CustomButton(
                        width: screenWidth(5),
                        onPressed: () =>
                            {homeViewController.increaseProgress()},
                        text: 'التالي',
                        color: AppColors.mainBlueColor,
                      ),
                    ],
                  ),
                  30.ph,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
