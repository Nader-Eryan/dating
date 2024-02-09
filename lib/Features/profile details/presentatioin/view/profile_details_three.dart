import 'package:dating/core/widgets/back_arrow_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/pofile_details_three_body.dart';

class ProfileDetailsThree extends StatelessWidget {
  const ProfileDetailsThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackArrowAppBar(),
      body: SafeArea(child: ProfileDetailsThreeBody()),
    );
  }
}
