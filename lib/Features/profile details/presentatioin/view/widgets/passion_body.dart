import 'package:dating/Features/profile%20details/data/model/passion_data.dart';
import 'package:dating/Features/profile%20details/presentatioin/manager/passion_view_controller.dart';
import 'package:dating/Features/profile%20details/presentatioin/view/notification_access_view.dart';
import 'package:dating/Features/profile%20details/presentatioin/view/widgets/passion_container.dart';
import 'package:dating/constants.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:dating/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PassionBody extends StatelessWidget {
  const PassionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPagePadding),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Your interests',
          style: Styles.kH1Bold,
        ),
        const Text(
          '''Select a few of your interests and '''
          '''let everyone know what you’re passionate about.''',
          style: Styles.kH5,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: Get.height / 2,
          child: GridView.builder(
            padding: const EdgeInsets.all(6),
            itemCount: listOfInterests.length,
            itemBuilder: (BuildContext context, int index) {
              return GetBuilder(
                  init: PassionController(),
                  builder: (controller) => GestureDetector(
                        onTap: () {
                          if (controller.listOfPassion.contains(index)) {
                            controller.removePassion(index);
                          } else {
                            controller.addPassion(index);
                          }
                        },
                        child: PassionContainer(
                          txt: listOfInterests[index].$1,
                          icon: listOfInterests[index].$2.runtimeType == Icon
                              ? listOfInterests[index].$2
                              : null,
                          svgPicture: listOfInterests[index].$2.runtimeType ==
                                  SvgPicture
                              ? listOfInterests[index].$2
                              : null,
                          index: index,
                        ),
                      ));
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: (Get.width / 2.5) / (Get.height / 16)),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        customButton(kPrimaryClr, 'Continue', () {
          Get.to(const NotificationAccessView());
        })
      ]),
    );
  }
}
