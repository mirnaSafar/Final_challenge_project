import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/constants.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/user_input.dart';
import 'package:flutter_templete/ui/shared/extensions.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/shared/validation_functions.dart';
import 'package:flutter_templete/ui/views/login_view/login_view.dart';
import 'package:flutter_templete/ui/views/signup_view/signup_controller.dart';
import 'package:get/get.dart';

import '../../shared/custom_widgets/custom_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignUpViewController controller = Get.put(SignUpViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(25)),
        child: Obx(() {
          print(controller.selectedValue);
          return Form(
            key: controller.formKey,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight(50)),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: SvgPicture.asset('assets/images/ic_back.svg')),
                      Expanded(
                        child: Center(
                          child: CustomText(
                            text: "إنشاء حساب",
                            fontSize: 18,
                            bold: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset('assets/images/signup.svg'),
                30.ph,
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 12.0),
                  child: CustomText(text: "اسم المستخدم "),
                ),
                10.ph,
                UserInput(
                  controller: controller.userNameController,
                  text: "اسم المستخدم",
                  prefixIcon: Transform.scale(
                    scale: 0.4,
                    child: SvgPicture.asset(
                      'assets/images/ic_user.svg',
                    ),
                  ),
                  validator: (name) => nameValidator(name),
                ),
                30.ph,
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 12.0),
                  child: CustomText(text: "رقم موبايل "),
                ),
                10.ph,
                UserInput(
                  controller: controller.phoneNumberController,
                  text: "رقم موبايل",
                  prefixIcon: Transform.scale(
                    scale: 0.4,
                    child: SvgPicture.asset(
                      'assets/images/ic_phone.svg',
                      color: AppColors.fieldTextPurpleColore,
                    ),
                  ),
                  validator: (number) => numberValidator(number),
                ),
                30.ph,
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 12.0),
                  child: CustomText(
                    text: "اختر الاختصاص",
                  ),
                ),
                screenHeight(40).ph,
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: majors.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return 40.px;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return index % 3 == 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Radio(
                                  visualDensity: VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity),
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColors.mainPurpleColore),
                                  value: index,
                                  groupValue: controller.selectedValue.value,
                                  onChanged: (value) {
                                    controller.selectedValue.value =
                                        value as int;
                                  },
                                ),
                              ),
                              CustomText(fontSize: 12, text: majors[index]),
                              10.px,
                              Transform.scale(
                                scale: 0.8,
                                child: Radio(
                                  visualDensity: VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity),
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColors.mainPurpleColore),
                                  value: index + 1,
                                  groupValue: controller.selectedValue.value,
                                  onChanged: (value) {
                                    controller.selectedValue.value =
                                        value as int;
                                  },
                                ),
                              ),
                              CustomText(fontSize: 12, text: majors[index + 1]),
                              10.px,
                              Transform.scale(
                                scale: 0.8,
                                child: Radio(
                                  visualDensity: VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity),
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColors.mainPurpleColore),
                                  value: index + 2,
                                  groupValue: controller.selectedValue.value,
                                  onChanged: (value) {
                                    controller.selectedValue.value =
                                        value as int;
                                  },
                                ),
                              ),
                              CustomText(fontSize: 12, text: majors[index + 2]),
                            ],
                          )
                        : Container();
                  },
                ),
                screenHeight(30).ph,
                CustomButton(
                  onPressed: () {
                    controller.formKey.currentState!.validate();
                    controller.submitForm();
                  },
                  text: 'إنشاء حساب',
                  color: AppColors.mainPurpleColore,
                ),
                screenHeight(40).ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'لديك حساب ؟ ',
                      textColor: AppColors.mainBlackColor,
                    ),
                    InkWell(
                        onTap: () => Get.to(() => LoginView()),
                        child: CustomText(
                          text: "تسجيل دخول",
                          textColor: AppColors.mainPurpleColore,
                        ))
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
