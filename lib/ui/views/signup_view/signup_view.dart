import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/user_input.dart';
import 'package:flutter_templete/ui/shared/extensions.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/signup_view/signup_controller.dart';
import 'package:get/get.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignUpViewController controller = Get.put(SignUpViewController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainWhiteColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(25)),
          child: Obx(() {
            print(controller.selectedValue);
            return ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight(50)),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: SvgPicture.asset('assets/images/ic_back.svg')),
                      120.px,
                      Center(
                        child: CustomText(
                          text: "إنشاء حساب",
                          fontSize: 20,
                          bold: true,
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset('assets/images/signup.svg'),
                CustomText(text: "اسم المستخدم "),
                10.ph,
                UserInput(
                  text: "اسم المستخدم",
                  prefixIcon: SvgPicture.asset(
                    'assets/images/ic_user_login.svg',
                    color: AppColors.fieldTextPurpleColore,
                    width: 10,
                  ),
                ),
                30.ph,
                CustomText(text: "رقم موبايل "),
                10.ph,
                UserInput(
                  text: "رقم موبايل",
                  prefixIcon: SizedBox(
                      width: 12,
                      height: 12,
                      child: SvgPicture.asset(
                        'assets/images/ic_phone.svg',
                        color: AppColors.fieldTextPurpleColore,
                      )),
                ),
                30.ph,
                CustomText(
                  text: "اختر الاختصاص",
                  fontSize: 18,
                ),
                RadioListTile(
                  title: CustomText(text: "الطب البشري"),
                  value: 1,
                  groupValue: controller.selectedValue,
                  onChanged: (value) {
                    controller.selectedValue.value = value as int;
                  },
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
