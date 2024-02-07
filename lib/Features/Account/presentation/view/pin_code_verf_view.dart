import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dating/Features/profile%20details/presentatioin/view/profile_details_one.dart';
import 'package:dating/core/utils/functions/verify_phone_number.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:dating/constants.dart';
import 'package:dating/core/widgets/back_arrow_app_bar.dart';

import '../../../../core/utils/functions/push_snack.dart';

class PinCodeVerificationView extends StatefulWidget {
  const PinCodeVerificationView(
      {Key? key,
      this.phoneNumber,
      required this.auth,
      required this.verificationId,
      required this.resendToken,
      required this.number})
      : super(key: key);

  final String? phoneNumber;
  final FirebaseAuth auth;
  final String? verificationId;
  final int? resendToken;
  final PhoneNumber number;
  @override
  State<PinCodeVerificationView> createState() =>
      _PinCodeVerificationViewState();
}

class _PinCodeVerificationViewState extends State<PinCodeVerificationView> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackArrowAppBar(),
      body: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 30),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                      'assets/images/bubble-gum-otp-verification.gif'),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Phone Number Verification',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                child: RichText(
                  text: TextSpan(
                    text: "Enter the code sent to ",
                    children: [
                      TextSpan(
                        text: "${widget.number.phoneNumber}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 30,
                  ),
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 6) {
                        return "Please enter a valid OTP";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                    cursorColor: Colors.black,

                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "*Please fill up all the cells properly" : "",
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive the code? ",
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () async {
                      try {
                        await verifyPhoneNumber(
                            context: context,
                            auth: widget.auth,
                            number: widget.number,
                            willNavigate: false);
                        if (mounted) {
                          pushSnackBar(
                              context,
                              'You have to wait at least 30 seconds before using this option',
                              ContentType.warning);
                        }
                      } catch (e) {
                        if (mounted) {
                          pushSnackBar(
                              context, e.toString(), ContentType.failure);
                        }
                      }
                    },
                    child: const Text(
                      "RESEND",
                      style: TextStyle(
                        color: Color(0xFF91D3B3),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                decoration: BoxDecoration(
                    color: kPrimaryClr,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.green.shade200,
                          offset: const Offset(1, -2),
                          blurRadius: 5),
                      BoxShadow(
                          color: Colors.green.shade200,
                          offset: const Offset(-1, 2),
                          blurRadius: 5)
                    ]),
                child: ButtonTheme(
                  height: 50,
                  child: TextButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: widget.verificationId!,
                                smsCode: currentText);
                        try {
                          await widget.auth.signInWithCredential(credential);
                          if (mounted) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileDetailsOne()));
                          }
                        } catch (e) {
                          errorShakeAnimation();
                        }
                      }
                      // conditions for validating
                      else {
                        errorShakeAnimation();
                      }
                    },
                    child: Center(
                      child: Text(
                        "VERIFY".toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void errorShakeAnimation() {
    errorController!
        .add(ErrorAnimationType.shake); // Triggering error shake animation
    setState(() => hasError = true);
  }
}
