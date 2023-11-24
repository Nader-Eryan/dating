import 'package:dating/constants.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:dating/core/widgets/back_arrow_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class EnterPhoneView extends StatefulWidget {
  const EnterPhoneView({super.key});

  @override
  State<EnterPhoneView> createState() => _EnterPhoneViewState();
}

class _EnterPhoneViewState extends State<EnterPhoneView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();

  bool isValidNum = false;
  PhoneNumber number = PhoneNumber();

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
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                            isValidNum = value;
                            setState(() {});
                          },
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.DIALOG,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.always,
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
                            if (isValidNum) {
                              context.go('/pinCodeVerf');
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll(Size(300.w, 50.h)),
                              backgroundColor:
                                  const MaterialStatePropertyAll(kPrimaryClr),
                              foregroundColor:
                                  const MaterialStatePropertyAll(Colors.white),
                            ),
                            onPressed: () {
                              formKey.currentState?.save();
                            },
                            child: const Text(
                              'Save',
                              style: Styles.kH3,
                            ),
                          ),
                        ),
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
