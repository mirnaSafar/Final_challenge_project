import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_widgets/page_header.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          PageHeader(),
          40.ph,
          Center(
            child: Container(
                width: 300,
                height: 200,
                child: SvgPicture.asset("assets/images/ic_app.svg")),
          ),
        ],
      ),
    ));
  }
}
