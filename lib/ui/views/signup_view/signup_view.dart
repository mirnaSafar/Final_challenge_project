import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
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
          print(controller.selectedMajor);
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
                // GridView.builder(
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //   ),
                //   itemCount: 2,
                //   itemBuilder: (BuildContext context, int index) {
                //     return ;
                //   },
                // ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.allColleges.length,
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
                                  value: controller.allColleges[index].uuid!,
                                  groupValue: controller.selectedValue.value,
                                  onChanged: (value) {
                                    controller.selectedValue.value =
                                        controller.allColleges[index].uuid!;

                                    controller.selectedMajor.value =
                                        controller.allColleges[index].name ??
                                            '';
                                  },
                                ),
                              ),
                              CustomText(
                                  fontSize: 12,
                                  text:
                                      controller.allColleges[index].name ?? ''),
                              10.px,
                              Transform.scale(
                                scale: 0.8,
                                child: Radio(
                                  visualDensity: VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity),
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColors.mainPurpleColore),
                                  value:
                                      controller.allColleges[index + 1].uuid!,
                                  groupValue: controller.selectedValue.value,
                                  onChanged: (value) {
                                    controller.selectedValue.value =
                                        controller.allColleges[index + 1].uuid!;
                                    // value as int;
                                    controller.selectedMajor.value =
                                        controller.allColleges[index + 1].name!;
                                  },
                                ),
                              ),
                              CustomText(
                                  fontSize: 12,
                                  text:
                                      controller.allColleges[index + 1].name!),
                              10.px,
                              // Transform.scale(
                              //   scale: 0.8,
                              //   child: Radio(
                              //     visualDensity: VisualDensity(
                              //         horizontal: VisualDensity.minimumDensity,
                              //         vertical: VisualDensity.minimumDensity),
                              //     fillColor: MaterialStateColor.resolveWith(
                              //         (states) => AppColors.mainPurpleColore),
                              //     value: index + 2,
                              //     groupValue: controller.selectedValue.value,
                              //     onChanged: (value) {
                              //       controller.selectedValue.value =
                              //           value as int;
                              //       controller.selectedMajor.value =
                              //           controller.allColleges[index + 2].name!;
                              //     },
                              //   ),
                              // ),
                              // CustomText(
                              //     fontSize: 12,
                              //     text:
                              //         controller.allColleges[index + 2].name ??
                              //             ''),
                            ],
                          )
                        : Container();
                  },
                ),
                screenHeight(30).ph,
                CustomButton(
                  onPressed: () {
                    controller.formKey.currentState!.validate();
                    controller.submitForm(
                        collage_id: controller.selectedValue.value,
                        name: controller.userNameController.text,
                        phone: controller.phoneNumberController.text);
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
