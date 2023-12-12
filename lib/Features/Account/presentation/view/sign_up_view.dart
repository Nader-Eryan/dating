import 'package:dating/Features/Account/data/repos/profile_repo_impl.dart';
import 'package:dating/Features/Account/presentation/view/enter_phone_view.dart';
import 'package:dating/constants.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:dating/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    final _profileRepo = ProfileRepoImpl();
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
            customButton(
              kPrimaryClr,
              'Use phone number',
              () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EnterPhoneView()));
              },
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
                    _profileRepo.signInWithFacebook();
                    _profileRepo.navigateToHome(context);
                  },
                  child: SvgPicture.asset('assets/images/facebook.svg'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _profileRepo.signInWithGoogle();
                    _profileRepo.navigateToHome(context);
                  },
                  child: SvgPicture.asset('assets/images/google.svg'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: SvgPicture.asset('assets/images/apple.svg'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
