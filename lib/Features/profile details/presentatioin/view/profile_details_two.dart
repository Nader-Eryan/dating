import 'package:dating/Features/profile%20details/presentatioin/view/widgets/profile_details_two_body.dart';
import 'package:flutter/material.dart';

class ProfileDetialsTwo extends StatelessWidget {
  const ProfileDetialsTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ProfileDetailsTwoBody()),
    );
  }
}
