import 'package:dating/Features/profile%20details/presentatioin/view/widgets/notification_access_body.dart';
import 'package:dating/constants.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../home/presentation/view/home_view.dart';

class NotificationAccessView extends StatelessWidget {
  const NotificationAccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              Get.offAll(const HomeView());
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Skip',
                style: Styles.kH5Bold.copyWith(color: kPrimaryClr),
              ),
            ),
          )
        ],
      ),
      body: const SafeArea(child: NotificationAccessBody()),
    );
  }
}
