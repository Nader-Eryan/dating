import 'package:dating/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InterestWidget extends StatefulWidget {
  const InterestWidget({super.key, required this.isActive, required this.txt});
  final bool isActive;
  final String txt;
  @override
  State<InterestWidget> createState() => _InterestWidgetState();
}

class _InterestWidgetState extends State<InterestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 4,
      height: Get.height / 24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: widget.isActive ? kPrimaryClr : Colors.grey.withOpacity(0.3),
          )),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        widget.isActive
            ? SvgPicture.asset('assets/images/done-all.svg')
            : const Text(''),
        Text(
          ' ${widget.txt}',
          style: TextStyle(
              color: widget.isActive ? kPrimaryClr : null,
              fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
