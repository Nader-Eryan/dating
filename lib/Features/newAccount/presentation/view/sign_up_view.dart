import 'package:dating/constants.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text(
              'Sign up to continue',
              style: Styles.kH4Bold,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    backgroundColor: MaterialStatePropertyAll(kPrimaryClr)),
                onPressed: () {},
                child: Text(
                  'Continue with email',
                  style: Styles.kH3Bold,
                )),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    foregroundColor: MaterialStatePropertyAll(kPrimaryClr)),
                onPressed: () {},
                child: Text(
                  'Use phone number',
                  style: Styles.kH3Bold,
                )),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                SizedBox(
                    width: 180.w,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ' Or sign up with ',
                            style: Styles.kH4,
                          )
                        ])),
                Expanded(
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
                    child: Text(
                      'Terms of use',
                      style: TextStyle(color: kPrimaryClr),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
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
