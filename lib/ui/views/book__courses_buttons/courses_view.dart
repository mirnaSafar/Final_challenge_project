import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_widgets/page_header.dart';

import '../../shared/utils.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({super.key});

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageHeader(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20), vertical: 0),
        child: ListView(children: [
          ListView.separated(
            shrinkWrap: true,
            itemCount: 4,
            separatorBuilder: (BuildContext context, int index) {
              return 30.ph;
            },
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? AppColors.opacityPurpleColore.withOpacity(0.25)
                        : AppColors.babyBlueColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/book.svg'),
                        10.px,
                        CustomText(text: '2023 دورة تشرين'),
                      ],
                    ),
                    SvgPicture.asset('assets/images/back_arrow.svg')
                  ],
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
