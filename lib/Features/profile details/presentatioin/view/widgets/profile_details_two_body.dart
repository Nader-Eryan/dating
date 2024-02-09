import 'package:dating/Features/profile%20details/presentatioin/manager/profile_details_two_controller.dart';
import 'package:dating/constants.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:dating/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../profile_details_three.dart';
import 'profile_two_button_style.dart';

class ProfileDetailsTwoBody extends StatelessWidget {
  const ProfileDetailsTwoBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'I am a',
            style: Styles.kH1Bold,
          ),
          const Spacer(
            flex: 4,
          ),
          SizedBox(
            height: 180.h,
            child: GetBuilder(
              init: ProfileDetailsThreeController(),
              builder: (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  profileThreeButton(Colors.black, 'Woman', () {
                    controller.setPressed('Woman');
                  }, Colors.grey.shade300, Colors.white,
                      pressed: controller.pressed),
                  profileThreeButton(Colors.black, 'Man', () {
                    controller.setPressed('Man');
                  }, Colors.grey.shade300, Colors.white,
                      pressed: controller.pressed),
                  profileThreeButton(Colors.black, 'Non-binary', () {
                    controller.setPressed('Non-binary');
                  }, Colors.grey.shade300, Colors.white,
                      pressed: controller.pressed),
                ],
              ),
            ),
          ),
          const Spacer(
            flex: 8,
          ),
          GetBuilder(
            init: ProfileDetailsThreeController(),
            builder: (c) => customButton(kPrimaryClr, 'Continue', () {
              if (c.pressed.isNotEmpty) {
                Get.to(const ProfileDetailsThree());
              }
            }),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
