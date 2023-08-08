import 'package:flutter/widgets.dart';

import '../../shared/utils.dart';
import '../main_view/main_view_widgets/page_header.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();

    // return SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       SizedBox(width: screenWidth(1), child: PageHeader()),
    //     ],
    //   ),
    // );
  }
}
