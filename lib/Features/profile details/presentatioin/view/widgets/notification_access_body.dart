import 'package:dating/Features/home/presentation/view/home_view.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:dating/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants.dart';

class NotificationAccessBody extends StatelessWidget {
  const NotificationAccessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPagePadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/chat.jpg'),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Enable notifications',
                style: Styles.kH3Bold,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Get push-notification when you get the match or receive a message.',
                textAlign: TextAlign.center,
                style: Styles.kH6,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          customButton(kPrimaryClr, 'I want to be notified', () {
            Get.offAll(const HomeView());
          })
        ],
      ),
    );
  }
}
