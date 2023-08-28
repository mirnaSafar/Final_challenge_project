import 'package:flutter/cupertino.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

import '../colors.dart';

class CustomUnderline extends StatelessWidget {
  const CustomUnderline({super.key, this.width, this.child, this.height});
  final double? width;
  final double? height;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? screenWidth(8),
      height: height ?? 2,
      decoration: BoxDecoration(
          color: AppColors.mainPurpleColore,
          // border: Border(
          //     bottom: BorderSide(
          //         color: AppColors.mainPurpleColore, width: 3, strokeAlign: 2)),
          boxShadow: [
            BoxShadow(
                blurRadius: 3,
                offset: Offset(0, 3),
                blurStyle: BlurStyle.normal,
                color: AppColors.lightPurpleColore)
          ]),
      child: child,
    );
  }
}
