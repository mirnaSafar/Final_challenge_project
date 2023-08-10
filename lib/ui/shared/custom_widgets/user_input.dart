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
      this.prefixIcon});
  bool? obscureText;
  final Icon? suffixIcon;
  final Widget? prefixIcon;
  final String text;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
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
            color: AppColors.fieldTextPurpleColore,
          ),
          filled: true,
          fillColor: AppColors.fieldPurpleColore,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
