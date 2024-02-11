import 'package:dating/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PassionContainer extends StatelessWidget {
  const PassionContainer(
      {super.key, this.svgPicture, this.icon, required this.txt});
  final Icon? icon;
  final SvgPicture? svgPicture;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 16,
      width: Get.width / 2.5,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        icon ?? svgPicture!,
        Text(
          txt,
          style: Styles.kH6Bold,
        )
      ]),
    );
  }
}