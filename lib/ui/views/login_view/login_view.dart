import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/user_input.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/shared/validation_functions.dart';
import 'package:flutter_templete/ui/views/home_view.dart/home_view.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainWhiteColor,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(30)),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight(50),
              ),
              child: CustomText(
                text: 'تسجيل الدخول',
                fontSize: 20,
                bold: true,
                textAlign: TextAlign.center,
              ),
            ),
            SvgPicture.asset('assets/images/Login.svg'),
            20.ph,
            CustomText(
              text: "اسم المستخدم",
              textAlign: TextAlign.start,
              textColor: AppColors.mainPurpleColore,
            ),
            10.ph,
            UserInput(
              prefixIcon: Transform.scale(
                  scale: 0.8,
                  child: SvgPicture.asset("assets/images/ic_user.svg")),
              text: "اسم المستخدم",
              controller: controller.userController,
              validator: (value) => nameValidator(value!),
            ),
            30.ph,
            CustomText(
              text: "رمز الدخول",
              textAlign: TextAlign.start,
              textColor: AppColors.mainPurpleColore,
            ),
            10.ph,
            UserInput(
                prefixIcon: Transform.scale(
                  scale: 0.8,
                  child: SvgPicture.asset(
                    "assets/images/ic_user.svg",
                  ),
                ),
                text: "رمز الدخول",
                controller: controller.passController,
                validator: (value) => passValidator(value!)),
            40.ph,
            CustomButton(
              text: "تسجيل الدخول",
              textColor: AppColors.mainWhiteColor,
              color: AppColors.mainPurpleColore,
              onPressed: () {
                Get.to(HomeView());
              },
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "ليس لديك حساب؟",
                ),
                InkWell(
                    child: CustomText(
                  text: "انشأ حسابك الان",
                  textColor: AppColors.mainPurpleColore,
                ))
              ],
            ),
            50.ph,
            InkWell(
              child: CustomText(
                text: "المتابعة كزائر",
                textAlign: TextAlign.center,
                // underline: true,
              ),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
