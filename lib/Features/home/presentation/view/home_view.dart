import 'package:dating/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text(
            'This is the test bold text',
            style: Styles.kH3Bold,
          ),
          Text(
            'This is the test regular text',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
