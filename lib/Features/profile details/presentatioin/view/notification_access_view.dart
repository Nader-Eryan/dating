import 'package:dating/constants.dart';
import 'package:flutter/material.dart';

class NotificationAccessView extends StatelessWidget {
  const NotificationAccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(kPagePadding),
        child: Column(
          children: [Text('notification view')],
        ),
      )),
    );
  }
}
