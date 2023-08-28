import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../colors.dart';
import '../utils.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
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
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
        onPressed: () => onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(
              size.width,
              screenHeight(18),
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
