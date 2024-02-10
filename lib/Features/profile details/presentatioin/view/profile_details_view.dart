import 'package:dating/core/utils/firebase_controller.dart';
import 'package:dating/Features/profile%20details/presentatioin/view/widgets/profile_details_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetailsView extends StatelessWidget {
  ProfileDetailsView({super.key});
  final controller = Get.put(FirebaseController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ProfileDetailsBody()),
    );
  }
}
