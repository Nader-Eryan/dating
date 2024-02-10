import 'package:dating/Features/profile%20details/presentatioin/manager/profile_details_two_controller.dart';
import 'package:dating/constants.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:dating/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../passion_view.dart';
import 'iam_button_style.dart';

class IamBody extends StatelessWidget {
  const IamBody({super.key});
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
                  iamButton(Colors.black, 'Woman', () {
                    controller.setPressed('Woman');
                  }, Colors.grey.shade300, Colors.white,
                      pressed: controller.pressed),
                  iamButton(Colors.black, 'Man', () {
                    controller.setPressed('Man');
                  }, Colors.grey.shade300, Colors.white,
                      pressed: controller.pressed),
                  iamButton(Colors.black, 'Non-binary', () {
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
                Get.to(const PassionsView());
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
