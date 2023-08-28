import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/user_input.dart';
import 'package:flutter_templete/ui/views/app_view/app_view.dart';
import 'package:get/get.dart';

import '../../shared/utils.dart';
import '../../shared/validation_functions.dart';
import '../main_view/main_view_widgets/page_header.dart';
import '../update_view.dart/update_view.dart';
import 'profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController controller = ProfileController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/avatar_user.svg"),
              20.ph,
              CustomText(
                text: "اسم المستخدم",
              ),
            ],
          ),
          50.ph,
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // textColor: AppColors.mainBlueColor,
            CustomText(
              text: "المعلومات الشخصية",
              textColor: AppColors.mainPurpleColore,
            ),

            InkWell(
              child: Transform.scale(
                  scale: 1,
                  child: SvgPicture.asset("assets/images/login_sign.svg")),
              onTap: () {
                Get.to(UpdateView());
              },
            ),
          ]),
          20.ph,
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // textColor: AppColors.mainBlueColor,
            CustomText(
              text: "ارسال شكاوي",
              textColor: AppColors.mainBlueColor,
            ),

            InkWell(
              child: Transform.scale(
                  scale: 1,
                  child: SvgPicture.asset("assets/images/ic_send.svg")),
              onTap: () {
                openDialog();
              },
            ),
          ]),
          20.ph,
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // textColor: AppColors.mainBlueColor,
            CustomText(
              text: "عن التطبيق",
              textColor: AppColors.fieldTextPurpleColore,
            ),

            InkWell(
              child: Transform.scale(
                  scale: 1,
                  child: SvgPicture.asset("assets/images/ic_details.svg")),
              onTap: () {
                Get.to(AppView());
              },
            ),
          ]),
          30.ph,
          CustomButton(
            text: "تسجيل الخروج",
            color: AppColors.mainPurpleColore,
            textColor: AppColors.mainWhiteColor,
          )
        ],
      ),
    );
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            title: Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                child: CustomText(
                  text: "x",
                  fontSize: 20,
                ),
                onTap: () {
                  context.pop();
                },
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/images/log.svg",
                  width: 100,
                  height: 100,
                ),
                20.ph,
                UserInput(
                  text: "ارسل شكوى او اقتراح",
                  maxLines: 7,
                  backgroundColor: AppColors.secondOgreyColor,
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomButton(
                  text: "ارسل",
                  onPressed: () {},
                ),
              )
            ],
          ));
}
