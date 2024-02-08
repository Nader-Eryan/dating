import 'package:dating/core/utils/firebase_controller.dart';
import 'package:dating/Features/profile%20details/presentatioin/view/widgets/profile_details_one_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetailsOne extends StatelessWidget {
  ProfileDetailsOne({super.key});
  final controller = Get.put(FirebaseController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ProfileDetailsOneBody()),
    );
  }
}
