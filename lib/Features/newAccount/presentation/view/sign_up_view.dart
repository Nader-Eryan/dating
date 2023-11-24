import 'package:dating/constants.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/back_arrow_app_bar.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackArrowAppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/trademark.svg'),
              ],
            ),
            const Text(
              'Sign up to continue',
              style: Styles.kH4Bold,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    backgroundColor: MaterialStatePropertyAll(kPrimaryClr)),
                onPressed: () {},
                child: const Text(
                  'Continue with email',
                  style: Styles.kH3Bold,
                )),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    foregroundColor: MaterialStatePropertyAll(kPrimaryClr)),
                onPressed: () {},
                child: const Text(
                  'Use phone number',
                  style: Styles.kH3Bold,
                )),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                SizedBox(
                    width: 180.w,
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ' Or sign up with ',
                            style: Styles.kH4,
                          )
                        ])),
                const Expanded(
                  child: Divider(
                    thickness: 2,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: SvgPicture.asset('assets/images/facebook.svg'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: SvgPicture.asset('assets/images/google.svg'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: SvgPicture.asset('assets/images/apple.svg'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Terms of use',
                      style: TextStyle(color: kPrimaryClr),
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Privacy policy',
                      style: TextStyle(color: kPrimaryClr),
                    )),
              ],
            )
          ],
        ),
      )),
    );
  }
}
