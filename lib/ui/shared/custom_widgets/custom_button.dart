import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../colors.dart';
import '../utils.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final double? width;
  final double? height;
  final Color? textColor;
  final Color? borderColor;
  final double? fontSize;
  // final Function? onPressed;
  final void Function()? onPressed;

  final String? imageName;
  final bool? loader;
  const CustomButton({
    super.key,
    required this.text,
    this.color = const Color.fromRGBO(111, 40, 119, 1),
    this.textColor,
    this.borderColor,
    this.onPressed,
    this.imageName,
    this.loader = false,
    this.width,
    this.height,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (loader!) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SpinKitCircle(
          color: AppColors.mainOrangeColor,
        ),
      );
    } else {
      return ElevatedButton(
          onPressed: () {
            onPressed!();
          },
          style: ElevatedButton.styleFrom(
              fixedSize: Size(
                width ?? size.width,
                height ?? screenHeight(18),
              ),
              // shape: const StadiumBorder(),
              backgroundColor: color,
              side: borderColor != null
                  ? BorderSide(
                      width: 1,
                      color: borderColor!,
                    )
                  : null),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: fontSize ?? 14),
              ),
            ],
          ));
    }
  }
}
