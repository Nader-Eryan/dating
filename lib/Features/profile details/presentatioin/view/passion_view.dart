import 'package:dating/core/widgets/back_arrow_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/passion_body.dart';

class PassionsView extends StatelessWidget {
  const PassionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackArrowAppBar(),
      body: SafeArea(child: PassionBody()),
    );
  }
}
