import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_controller.dart';
import 'package:get/get.dart';

class PageHeader extends StatefulWidget implements PreferredSizeWidget {
  const PageHeader({super.key, this.text});

  final String? text;
  @override
  State<PageHeader> createState() => _PageHeaderState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(screenWidth(1), screenHeight(1));
}

class _PageHeaderState extends State<PageHeader> {
  MainViewController controller = Get.put(MainViewController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          SvgPicture.asset(
            'assets/images/shapeMaker.svg',
            width: screenWidth(1),
            color: controller.pageHeaderColor.value,
          ),
          Positioned(
            bottom: 50,
            right: 30,
            child: Row(
              children: [
                SvgPicture.asset(
                  color: AppColors.mainWhiteColor,
                  controller.pageHeaderIcon.value,
                ),
                10.px,
                CustomText(
                  text: controller.pageTitle.value,
                  textColor: AppColors.mainWhiteColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
