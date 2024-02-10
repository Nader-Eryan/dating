import 'package:dating/Features/profile%20details/presentatioin/view/widgets/passion_container.dart';
import 'package:dating/constants.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PassionBody extends StatelessWidget {
  const PassionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(kPagePadding),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Your interests',
          style: Styles.kH1Bold,
        ),
        Text(
          '''Select a few of your interests and '''
          '''let everyone know what you’re passionate about.''',
          style: Styles.kH5,
        ),
        SizedBox(
          height: 32,
        ),
        //ListView()
        PassionContainer(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: kPrimaryClr,
            ),
            txt: 'Shopping')
      ]),
    );
  }
}
