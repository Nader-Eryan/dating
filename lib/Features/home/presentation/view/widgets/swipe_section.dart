import 'package:dating/Features/Account/presentation/view/on_boarding_view.dart';
import 'package:dating/core/utils/service_locator.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwipeSection extends StatelessWidget {
  const SwipeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'This is the test bold text',
          style: Styles.kH3Bold,
        ),
        const Text(
          'This is the test regular text',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
            onPressed: () {
              getIt<FirebaseAuth>().signOut().then((value) async {
                Get.offAll(() => const OnBoardingView());
              });
            },
            child: const Text('Logout'))
      ],
    );
  }
}
