import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/user_input.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_widgets/page_header.dart';
import 'package:flutter_templete/ui/views/profile_view/profile_view.dart';
import 'package:flutter_templete/ui/views/update_view.dart/update_controller.dart';
import 'package:get/get.dart';

class UpdateView extends StatefulWidget {
  const UpdateView({super.key});

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  UpdateController controller = Get.put(UpdateController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeader(),
              CustomText(
                text: controller.userController.text,
                textColor: AppColors.mainPurpleColore,
              ),
              10.ph,
              UserInput(
                text: "مايا شليل",
                textColor: AppColors.mainPurpleColore,
                backgroundColor: AppColors.secondBlueColor,
                prefixIcon: Transform.scale(
                    scale: 0.5,
                    child: SvgPicture.asset("assets/images/ic_user.svg")),
                suffixIcon: Transform.scale(
                    scale: 0.5,
                    child: SvgPicture.asset("assets/images/login_sign.svg")),
              ),
              20.ph,
              CustomText(
                text: controller.numberController.text,
                textColor: AppColors.mainPurpleColore,
              ),
              10.ph,
              UserInput(
                text: "0999-123-445",
                textColor: AppColors.mainPurpleColore,
                backgroundColor: AppColors.secondBlueColor,
                prefixIcon: Transform.scale(
                    scale: 0.5,
                    child: SvgPicture.asset("assets/images/ic_number.svg")),
                suffixIcon: Transform.scale(
                    scale: 0.5,
                    child: SvgPicture.asset("assets/images/login_sign.svg")),
              ),
              140.ph,
              CustomButton(
                text: "حفظ التغيرات",
                color: AppColors.mainPurpleColore,
                textColor: AppColors.mainWhiteColor,
              ),
              Center(
                child: InkWell(
                  child: CustomText(
                    textColor: AppColors.mainPurpleColore,
                    text: "تراجع",
                    textAlign: TextAlign.center,
                    underline: true,
                  ),
                  onTap: () {
                    Get.off(MainView());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
