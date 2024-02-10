import 'package:flutter/material.dart';

import 'package:dating/Features/profile%20details/presentatioin/view/widgets/iam_body.dart';
import 'package:dating/core/widgets/back_arrow_app_bar.dart';

class IamView extends StatelessWidget {
  const IamView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackArrowAppBar(),
      body: SafeArea(child: IamBody()),
    );
  }
}
