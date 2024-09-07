import 'dart:async';
import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating/Features/profile%20details/presentatioin/manager/profie_details_controller.dart';
import 'package:dating/Features/profile%20details/presentatioin/view/iam_view.dart';
import 'package:dating/core/utils/service_locator.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:dating/core/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/functions/push_snack.dart';

class ProfileDetailsBody extends StatefulWidget {
  const ProfileDetailsBody({super.key});

  @override
  State<ProfileDetailsBody> createState() => _ProfileDetailsBodyState();
}

class _ProfileDetailsBodyState extends State<ProfileDetailsBody> {
  DateTime selectedDate = DateTime(2000, 1, 1);
  final _formKey = GlobalKey<FormState>();
  CollectionReference users =
      getIt.get<FirebaseFirestore>().collection('users');
  String uid = getIt.get<FirebaseAuth>().currentUser!.uid;

  final TextEditingController fNameController = TextEditingController(),
      sNameController = TextEditingController();
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
  void dispose() {
    fNameController.dispose();
    sNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPagePadding),
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
                        : const AssetImage('') as ImageProvider,
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
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        },
                        controller: fNameController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                        ],
                        maxLength: 20,
                        decoration: const InputDecoration(
                            label: Text('First name'),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)))),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        },
                        controller: sNameController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                        ],
                        maxLength: 20,
                        decoration: const InputDecoration(
                            label: Text('Last name'),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)))),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                    ],
                  )),
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
                  child: customButton(kPrimaryClr, 'Confirm', () async {
                    if (_formKey.currentState!.validate()) {
                      if (fNameController.text.isNotEmpty &&
                          sNameController.text.isNotEmpty) {
                        bool state = await addUser(
                            fNameController.text,
                            sNameController.text,
                            DateTime.now().year - selectedDate.year);
                        if (state) {
                          Get.to(const IamView());
                        } else if (mounted) {
                          pushSnackBar(context, 'Opps, Check your internet',
                              ContentType.failure);
                        }
                      }
                    }
                  }))
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> addUser(String fName, String lName, int age) {
    return users
        .doc(uid)
        .set({'fName': fName, 'lName': lName, 'age': age})
        .then((value) => true)
        .catchError((error) => false);
  }
}
