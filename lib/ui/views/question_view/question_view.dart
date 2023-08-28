import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions.dart';
import 'package:flutter_templete/ui/views/favorites_view.dart/favorites_view.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_widgets/page_header.dart';
import 'package:flutter_templete/ui/views/profile_view/profile_view.dart';
import 'package:flutter_templete/ui/views/question_view/question_controller.dart';
import 'package:get/get.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({super.key});

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());

    List<Map<String, dynamic>> favorite = [
      {
        "id": 1,
        "question": "what is the DNS",
        "answer": [
          {"id": 1, "text": "Answer 1"},
          {"id": 2, "text": "Answer 2"},
          {"id": 3, "text": "Answer 3"}
        ],
        "correct_id": 1
      }
    ];
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: ListView(
        children: [
          PageHeader(),
          CustomText(text: favorite[0]["question"]),
          20.ph,
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  height: 75,
                  decoration: BoxDecoration(
                      color: AppColors.mainWhiteColor,
                      border: Border.all(
                          color: AppColors.mainBlackColor,
                          style: BorderStyle.solid,
                          width: 1)),
                  child: InkWell(
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Radio(
                                  value: index,
                                  groupValue: controller.selectedValue.value,
                                  onChanged: (Value) {
                                    controller.selectedValue.value =
                                        Value as int;
                                  }),
                              // CustomText(text: favorite[index]["answer"]["text"])
                            ],
                          ),
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return 20.ph;
              },
              itemCount: favorite.length),
          20.ph,
          Row(children: [
            Transform.scale(
                scale: 0.9,
                child: SvgPicture.asset("assets/images/ic_check.svg")),
            8.px,
            Transform.scale(
                scale: 0.9,
                child: SvgPicture.asset("assets/images/ic_book.svg")),
            8.px,
            Transform.scale(
                scale: 0.9,
                child: SvgPicture.asset("assets/images/ic_star.svg")),
          ]),
          60.ph,
          Row(
            children: [
              Expanded(
                  child: CustomButton(
                color: AppColors.mainWhiteColor,
                text: "السابق",
                fontSize: 18,
                textColor: AppColors.mainBlueColor,
                borderColor: AppColors.mainBlueColor,
                onPressed: () {
                  Get.off(FavoritesView());
                },
              )),
              220.px,
              Expanded(
                  child: CustomButton(
                onPressed: () {
                  Get.to(ProfileView());
                },
                text: "التالي",
                fontSize: 18,
              ))
            ],
          )
        ],
      ),
    )));
  }
}
