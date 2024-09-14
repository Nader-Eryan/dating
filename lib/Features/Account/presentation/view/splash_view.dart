import 'dart:async';

import 'package:dating/Features/Account/presentation/view/on_boarding_view.dart';
import 'package:dating/Features/home/presentation/view/home_view.dart';
import 'package:dating/core/utils/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  double _turns = 0.0;
  Timer? _timer;
  double _leftPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(microseconds: 5000), (timer) {
      _rotate();
      _moveRight();
    });
    Future.delayed(const Duration(milliseconds: 2200)).then((value) {
      if (getIt.get<FirebaseAuth>().currentUser?.uid != null) {
        Get.off(() => const HomeView());
      } else {
        Get.off(() => const OnBoardingView());
      }
    });
  }

  void _moveRight() {
    setState(() {
      _leftPosition += 100.0;
    });
  }

  void _rotate() {
    if (mounted) {
      setState(() {
        _turns += 1 / 8; // Rotate
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(seconds: 3),
              curve: Curves.easeInOut,
              margin: EdgeInsets.only(left: _leftPosition),
              child: AnimatedRotation(
                turns: _turns,
                duration: const Duration(seconds: 30),
                child: SvgPicture.asset('assets/images/trademark.svg'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
