import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating/Features/profile%20details/presentatioin/manager/iam_controller.dart';
import 'package:dating/constants.dart';
import 'package:dating/core/utils/service_locator.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:dating/core/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../passion_view.dart';
import 'iam_button_style.dart';

class IamBody extends StatelessWidget {
  IamBody({super.key});
  final CollectionReference users =
      getIt.get<FirebaseFirestore>().collection('users');
  final String uid = getIt.get<FirebaseAuth>().currentUser!.uid;

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
              init: IamController(),
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
            init: IamController(),
            builder: (c) => customButton(kPrimaryClr, 'Continue', () async {
              if (c.pressed.isNotEmpty) {
                try {
                  await addUserGender(c.pressed);
                  Get.to(const PassionsView());
                } catch (e) {
                  Get.snackbar('Opps!', 'bad internet connection');
                }
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

  Future<bool> addUserGender(String sex) {
    return users
        .doc(uid)
        .update({'sex': sex})
        .then((value) => true)
        .catchError((error) => false);
  }
}
