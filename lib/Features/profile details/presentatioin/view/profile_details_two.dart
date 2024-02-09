import 'package:dating/Features/profile%20details/presentatioin/view/widgets/profile_details_two_body.dart';
import 'package:dating/core/widgets/back_arrow_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileDetialsTwo extends StatelessWidget {
  const ProfileDetialsTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackArrowAppBar(),
      body: SafeArea(child: ProfileDetailsTwoBody()),
    );
  }
}
