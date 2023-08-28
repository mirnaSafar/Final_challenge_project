import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_controller.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_widgets/page_header.dart';
import 'package:flutter_templete/ui/views/subject_test/subject_test.dart';
import 'package:get/get.dart';

class BookCourseButtons extends StatefulWidget {
  const BookCourseButtons({super.key});

  @override
  State<BookCourseButtons> createState() => _BookCourseButtonsState();
}

class _BookCourseButtonsState extends State<BookCourseButtons> {
  MainViewController mainViewController = Get.put(MainViewController());

  @override
  Widget build(BuildContext context) {
    String title = mainViewController.pageTitle.value;
    return WillPopScope(
      onWillPop: () {
        int index = mainViewController.pageTitle.value.lastIndexOf('/');

        mainViewController.pageTitle.value =
            // mainViewController.pageTitle.value
            mainViewController.pageTitle.value.substring(0, index);
        mainViewController.pageHeaderIcon.value = 'assets/images/ic_back.svg';

        return Future(() => true);
      },
      child: Scaffold(
        appBar: PageHeader(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 60,
          ),
          child: Column(children: [
            CustomButton(
              text: 'دورات',
              color: AppColors.mainBlueColor,
              onPressed: () {
                // mainViewController.pageHeaderColor.value =
                //     AppColors.mainBlueColor;
                mainViewController.pageTitle.value += ' / الدورات';
                context.push(SubjectTestView());
              },
            ),
            30.ph,
            CustomButton(
              text: 'أسئلة الكتاب',
              onPressed: () {
                mainViewController.pageTitle.value += ' / أسئلة الكتاب';
              },
            ),
          ]),
        ),
      ),
    );
  }
}
