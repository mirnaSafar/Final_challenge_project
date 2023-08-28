import 'package:flutter/material.dart';

import '../main_view/main_view_widgets/page_header.dart';

class SubjectCoursesView extends StatefulWidget {
  const SubjectCoursesView({super.key});

  @override
  State<SubjectCoursesView> createState() => _SubjectCoursesViewState();
}

class _SubjectCoursesViewState extends State<SubjectCoursesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageHeader(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 60,
        ),
        child: Column(children: []),
      ),
    );
  }
}
