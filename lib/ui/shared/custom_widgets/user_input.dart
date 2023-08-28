import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

// ignore: must_be_immutable
class UserInput extends StatefulWidget {
  UserInput(
      {super.key,
      required this.text,
      this.controller,
      this.validator,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixIcon,
      this.backgroundColor,
      this.textColor,
      this.maxLines,
      this.fillColor});
  bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final int? maxLines;

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Color? fillColor;
  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height * 0),
      child: TextFormField(
        maxLines: widget.maxLines ?? 1,
        obscureText: widget.obscureText!,
        // autovalidateMode: AutovalidateMode.,
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.obscureText!
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText!;
                    });
                  },
                  icon: Icon(widget.obscureText!
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                )
              : widget.suffixIcon,
          contentPadding:
              EdgeInsets.symmetric(horizontal: screenWidth(10), vertical: 4),
          hintText: widget.text,
          prefixIcon: widget.prefixIcon,
          hintStyle: TextStyle(
            color: widget.textColor ?? AppColors.fieldTextPurpleColore,
          ),
          filled: true,
          fillColor: widget.fillColor ?? AppColors.fieldPurpleColore,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
