import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dating/Features/Account/data/repos/profile_repo_impl.dart';
import 'package:dating/constants.dart';
import 'package:dating/core/utils/functions/push_snack.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:dating/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    final profileRepo = ProfileRepoImpl();
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
            const Text(
              'Sign in to continue',
              style: Styles.kH4Bold,
            ),
            customButton(Colors.grey, 'Use phone number', null
                // () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const EnterPhoneView()));
                // },
                ),
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
                            ' Or sign in with ',
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
                  onPressed: () {
                    try {
                      profileRepo.signInWithFacebook(context);
                    } catch (e) {
                      pushSnackBar(
                          context,
                          'There was an error, please try again later!',
                          ContentType.failure);
                    }
                  },
                  child: SvgPicture.asset(
                    'assets/images/facebook.svg',
                    width: 40.w,
                    height: 40.h,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    try {
                      profileRepo.signInWithGoogle(context).then((value) {});
                    } catch (e) {
                      pushSnackBar(
                          context,
                          'There was an error, please try again later!',
                          ContentType.failure);
                    }
                  },
                  child: SvgPicture.asset(
                    'assets/images/google.svg',
                    width: 40.w,
                    height: 40.h,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    pushSnackBar(
                        context,
                        'Opps, you\'re not using an Apple device!',
                        ContentType.warning);
                  },
                  child: SvgPicture.asset(
                    'assets/images/apple.svg',
                    width: 40.w,
                    height: 40.h,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      profileRepo.urlLauncher(
                          'https://github.com/Nader-Eryan/findy-Privacy-policy/blob/main/README');
                    },
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
