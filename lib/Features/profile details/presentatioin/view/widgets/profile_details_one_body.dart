import 'dart:async';
import 'dart:io';

import 'package:dating/Features/profile%20details/presentatioin/manager/profie_details_controller.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:dating/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../constants.dart';

class ProfileDetailsOneBody extends StatefulWidget {
  const ProfileDetailsOneBody({super.key});

  @override
  State<ProfileDetailsOneBody> createState() => _ProfileDetailsOneBodyState();
}

class _ProfileDetailsOneBodyState extends State<ProfileDetailsOneBody> {
  DateTime selectedDate = DateTime(2000, 1, 1);
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: SingleChildScrollView(
        child: SizedBox(
          height: 580.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Profile details',
                    style: Styles.kH1Bold,
                  ),
                ],
              ),
              const Spacer(
                flex: 3,
              ),
              GetBuilder<ProfileDetailsController>(
                init: ProfileDetailsController(),
                builder: (controller) => GestureDetector(
                  child: CircleAvatar(
                    radius: 100.w,
                    backgroundImage: controller.imgPath != null
                        ? FileImage(File(controller.imgPath))
                        : const AssetImage('assets/images/face.svg')
                            as ImageProvider,
                    child: SvgPicture.asset(
                      'assets/images/face.svg',
                      width: 150.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () {
                    controller.pickPicture(context);
                  },
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              TextFormField(
                maxLength: 20,
                decoration: const InputDecoration(
                    label: Text('First name'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              TextFormField(
                maxLength: 20,
                decoration: const InputDecoration(
                    label: Text('Last name'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Flexible(
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.date_range,
                          color: kPrimaryClr,
                        ),
                        label: Text(
                          'Choose birthday date',
                          style: Styles.kH4Bold.copyWith(color: Colors.red),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red.shade100),
                          minimumSize:
                              MaterialStateProperty.all(const Size(260, 56)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                        onPressed: () => selectDate(context),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: Styles.kH3,
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              ),
              SizedBox(
                  width: double.infinity,
                  child: customButton(kPrimaryClr, 'Confirm', () {}))
            ],
          ),
        ),
      ),
    );
  }
}
