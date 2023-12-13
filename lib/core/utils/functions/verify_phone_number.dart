import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dating/Features/home/presentation/view/home_view.dart';
import 'package:dating/core/utils/functions/push_snack.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../Features/Account/presentation/view/pin_code_verf_view.dart';

Future<void> verifyPhoneNumber(
    {required BuildContext context,
    required FirebaseAuth auth,
    required PhoneNumber number,
    required bool willNavigate}) async {
  await auth.verifyPhoneNumber(
    timeout: const Duration(seconds: 30),
    phoneNumber: number.phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) {
      auth.signInWithCredential(credential);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeView()));
    },
    verificationFailed: (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {
        pushSnackBar(context, 'The provided phone number is not valid.',
            ContentType.failure);
      } else {
        pushSnackBar(context, 'There was an error, please try again!',
            ContentType.failure);
      }
    },
    codeSent: (String verificationId, int? resendToken) async {
      if (willNavigate) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PinCodeVerificationView(
                number: number,
                auth: auth,
                verificationId: verificationId,
                resendToken: resendToken)));
      }
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}
