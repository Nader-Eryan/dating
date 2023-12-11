import 'package:dating/constants.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:dating/core/widgets/back_arrow_app_bar.dart';
import 'package:dating/core/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../core/utils/functions/verify_phone_number.dart';

class EnterPhoneView extends StatefulWidget {
  const EnterPhoneView({super.key});

  @override
  State<EnterPhoneView> createState() => _EnterPhoneViewState();
}

class _EnterPhoneViewState extends State<EnterPhoneView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();

  PhoneNumber number = PhoneNumber();
  late FirebaseAuth auth;
  bool isValid = false;
  @override
  void initState() {
    auth = FirebaseAuth.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackArrowAppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 500.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Phone number',
                  style: Styles.kH1Bold,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Please enter your valid phone number. We will send you a 6-digit code to verify your account. ',
                  style: Styles.kH4,
                ),
                Flexible(
                  flex: 4,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber num) {
                            number = num;
                          },
                          onInputValidated: (bool value) {
                            isValid = value;
                          },
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.DIALOG,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          selectorTextStyle:
                              const TextStyle(color: Colors.black),
                          initialValue: number,
                          textFieldController: controller,
                          formatInput: true,
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          inputBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                          onSaved: (PhoneNumber number) {
                            // if (isValidNum) {
                            //   context.go('/pinCodeVerf');
                            // }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: customButton(kPrimaryClr, 'Save', () async {
                              formKey.currentState?.save();
                              if (isValid) {
                                await verifyPhoneNumber(
                                    context: context,
                                    auth: auth,
                                    number: number,
                                    willNavigate: true);
                              }
                            })),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
