import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/home_view.dart/home_view.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_widgets/page_header.dart';
import 'package:get/get.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth(30)),
      child: Column(
        children: [
          PageHeader(),
          screenHeight(8).ph,
          SvgPicture.asset(
            "assets/images/ic_noty.svg",
            width: 150,
            height: 150,
          ),
          20.ph,
          CustomText(
            text: "الاشعارات",
            fontSize: 30,
            textColor: AppColors.mainGreyColor,
          ),
          20.ph,
          CustomText(
            text:
                "  ابقى على اطلاع بمواعيد الامتحان الوطني\nوصدورالنتائج اجوبة الاسئلةوالكثير من الاخبار",
            fontSize: 18,
          ),
          40.ph,
          CustomButton(
            text: "تفعيل الاشعارات",
            textColor: AppColors.mainWhiteColor,
            color: AppColors.mainPurpleColore,
            onPressed: () {
              Get.to(HomeView());
            },
          ),
          10.ph,
          CustomText(
            text: "تجاهل",
            underline: true,
          )
        ],
      ),
    );
  }
}
