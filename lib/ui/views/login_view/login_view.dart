import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/user_input.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainWhiteColor,
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight(50)),
              child: CustomText(
                text: 'تسجيل الدخول',
                fontSize: 20,
              ),
            ),
            SvgPicture.asset('assets/images/Login.svg'),
            UserInput(text: "اسم المستخدم")
          ],
        ),
      ),
    );
  }
}
