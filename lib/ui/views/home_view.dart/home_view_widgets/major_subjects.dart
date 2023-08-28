import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/extensions.dart';
import 'package:flutter_templete/ui/views/book__courses_buttons/book_courses_button.dart';
import 'package:flutter_templete/ui/views/home_view.dart/home_view_widgets/home_top_section.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_widgets/page_header.dart';
import 'package:flutter_templete/ui/views/subject_test/subject_test.dart';
import 'package:get/get.dart';

import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_button.dart';
import '../../../shared/utils.dart';
import '../../book__courses_buttons/courses_view.dart';

class MajorSubjects extends StatefulWidget {
  const MajorSubjects({super.key, required this.major});
  final String major;
  @override
  State<MajorSubjects> createState() => _MajorSubjectsState();
}

class _MajorSubjectsState extends State<MajorSubjects> {
  // List<Map<String, dynamic>> majorsSubjects = [
  //   {
  //     'major': "مترجمات",
  //   },
  //   {
  //     'major': "داتا بيز",
  //   },
  //   {
  //     'major': "اوتومات",
  //   },
  //   {
  //     'major': "شبكات",
  //   },
  //   {
  //     'major': "الذكاء الاصطناعي",
  //   },
  //   {
  //     'major': " قواعد المعطيات",
  //   },
  //   {
  //     'major': " هندسة برمجيات",
  //   },
  //   {
  //     'major': " امن ",
  //   },
  //   {
  //     'major': " خوارزميات",
  //   }
  // ];
  @override
  // void initState() {
  //   mainViewController.pageTitle.value = widget.major;
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        mainViewController.pageTitle.value = 'الرئيسية';
        return Future(() => true);
      },
      child: Obx(
        () => Scaffold(
          appBar: PageHeader(),
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: screenWidth(30), vertical: 0),
            child: ListView(
              children: [
                HomeTopSection(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 60.0),
                  child: Column(
                    children: [
                      30.ph,
                      Wrap(
                        // verticalDirection: VerticalDirection.down,
                        // crossAxisAlignment: WrapCrossAlignment.center,
                        children: List.generate(
                          homeViewController.collegeSubjects.length,
                          (index) => InkWell(
                            onTap: () {
                              mainViewController.pageTitle.value =
                                  widget.major +
                                      ' / ' +
                                      homeViewController
                                          .collegeSubjects[index].name!;

                              context.push(BookCourseButtons());
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 6),
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: AppColors.mainPurpleColore,
                                      width: 1)),
                              child: Text(homeViewController
                                      .collegeSubjects[index].name ??
                                  ''),
                            ),
                          ),
                        ),
                        runSpacing: 20,
                        spacing: 0,
                        alignment: WrapAlignment.center,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomButton(
                                text: "الدورات",
                                color: AppColors.mainBlueColor,
                                onPressed: () {
                                  mainViewController.pageHeaderColor.value =
                                      AppColors.mainBlueColor;
                                  mainViewController.pageTitle.value =
                                      ' الدورات';
                                  context.push(CoursesView());
                                  // majorSubjects(signUpViewController.selectedMajor.value);
                                },
                              ),
                            ),
                            30.px,
                            Expanded(
                              child: CustomButton(
                                text: "بنك الأسئلة",
                                onPressed: () {
                                  homeViewController.getBookQuestions(
                                      collegeID: signUpViewController
                                          .selectedValue.value);
                                  context.push(SubjectTestView());
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
