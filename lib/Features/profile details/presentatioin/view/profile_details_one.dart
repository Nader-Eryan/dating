import 'package:dating/Features/profile%20details/presentatioin/view/widgets/profile_details_one_body.dart';
import 'package:flutter/material.dart';

class ProfileDetailsOne extends StatelessWidget {
  const ProfileDetailsOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ProfileDetailsOneBody()),
    );
  }
}
