import 'package:dating/Features/profile%20details/presentatioin/manager/passion_view_controller.dart';
import 'package:dating/constants.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PassionContainer extends StatelessWidget {
  const PassionContainer({
    super.key,
    this.svgPicture,
    this.icon,
    required this.txt,
    required this.index,
  });
  final Icon? icon;
  final SvgPicture? svgPicture;
  final String txt;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PassionController(),
      builder: (controller) => Container(
        height: Get.height / 16,
        width: Get.width / 2.5,
        decoration: BoxDecoration(
          border: Border.all(
              color: controller.listOfPassion.contains(index)
                  ? kPrimaryClr
                  : Colors.grey.shade300),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          icon ?? svgPicture!,
          Text(
            txt,
            style: Styles.kH6Bold,
          )
        ]),
      ),
    );
  }
}
