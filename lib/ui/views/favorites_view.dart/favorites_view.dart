import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/views/question_view/question_view.dart';
import 'package:get/get.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
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
      },
      {
        "id": 2,
        "question": "what is the DNS",
        "answer": [
          {"id": 1, "text": "Answer 1"},
          {"id": 2, "text": "Answer 2"},
          {"id": 3, "text": "Answer 3"}
        ],
        "correct_id": 2
      }
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 100),
      child: ListView(
        children: [
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  height: 50,
                  color: AppColors.fieldPurpleColore,
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: SvgPicture.asset("assets/images/vector.svg"),
                          onTap: () {
                            Get.to(QuestionView());
                          },
                        ),
                        CustomText(text: favorite[index]["question"])
                      ],
                    ),
                    onTap: () {},
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return 20.ph;
              },
              itemCount: favorite.length)
        ],
      ),
    );
  }
}
