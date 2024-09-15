import 'package:dating/Features/Account/presentation/view/on_boarding_view.dart';
import 'package:dating/Features/home/presentation/manager/bottom_nav_controller.dart';
import 'package:dating/constants.dart';
import 'package:dating/core/utils/service_locator.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
        ),
      ),
      bottomNavigationBar: GetBuilder(
        init: BottomNavController(),
        builder: (c) => BottomNavigationBar(
            showSelectedLabels: false,
            backgroundColor: const Color(0xFFF3F3F3),
            onTap: (value) {
              c.changeNav(value);
            },
            currentIndex: c.currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/cards.svg'),
                  label: 'Home',
                  activeIcon: SvgPicture.asset(
                    'assets/images/cards.svg',
                    colorFilter: const ColorFilter.mode(
                      kPrimaryClr,
                      BlendMode.srcIn,
                    ),
                  )),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/images/like.svg'),
                label: 'Match',
                activeIcon: SvgPicture.asset(
                  'assets/images/like.svg',
                  colorFilter: const ColorFilter.mode(
                    kPrimaryClr,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/images/message.svg'),
                label: 'Message',
                activeIcon: SvgPicture.asset(
                  'assets/images/message.svg',
                  colorFilter: const ColorFilter.mode(
                    kPrimaryClr,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/images/people.svg'),
                label: 'Profile',
                activeIcon: SvgPicture.asset(
                  'assets/images/people.svg',
                  colorFilter: const ColorFilter.mode(
                    kPrimaryClr,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
