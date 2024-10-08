import 'package:dating/Features/Account/presentation/view/sign_up_view.dart';
import 'package:dating/Features/home/presentation/view/home_view.dart';
import 'package:dating/constants.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:dating/core/widgets/custom_button.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  OnBoardingViewState createState() => OnBoardingViewState();
}

class OnBoardingViewState extends State<OnBoardingView> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeView()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      bodyFlex: 2,
      imageFlex: 4,
      safeArea: 120,
      titleTextStyle: Styles.kH3Bold,
      bodyTextStyle: Styles.kH4,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.only(top: 32),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: false,
      autoScrollDuration: null,
      infiniteAutoScroll: false,

      globalFooter: Column(
        children: [
          customButton(kPrimaryClr, 'Let\'s go', () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SignUpView()));
          }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      pages: [
        PageViewModel(
          title: "Matches",
          body:
              "We match you with people that have a large array of similar interests.",
          image: _buildImage('girl2.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
            title: "Algorithm",
            body:
                "Users going through a vetting process to ensure you never match with bots.",
            image: _buildImage('girl1.jpg'),
            decoration: pageDecoration),
        PageViewModel(
            title: "Premium",
            body:
                "Sign up today and enjoy the first month of premium benefits on us.",
            image: _buildImage('girl3.jpg'),
            decoration: pageDecoration),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      showNextButton: false,
      showDoneButton: false,
      //rtl: true, // Display as right-to-left
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.grey,
        activeColor: kPrimaryClr,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
