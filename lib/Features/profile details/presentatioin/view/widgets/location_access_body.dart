import 'package:dating/Features/profile%20details/presentatioin/view/notification_access_view.dart';
import 'package:dating/constants.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:dating/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationAcessBody extends StatelessWidget {
  const LocationAcessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPagePadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset('assets/images/location.svg'),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Search friends',
                style: Styles.kH3Bold,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'You can find friends from locations around you.',
                textAlign: TextAlign.center,
                style: Styles.kH6,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          customButton(kPrimaryClr, 'Access to location', () async {
            await Permission.location
                .onDeniedCallback(() {})
                .onGrantedCallback(() {
                  Get.off(const NotificationAccessView());
                })
                .onPermanentlyDeniedCallback(() {})
                .onRestrictedCallback(() {})
                .onLimitedCallback(() {
                  Get.off(const NotificationAccessView());
                })
                .onProvisionalCallback(() {})
                .request();
            if (await Permission.location.isGranted ||
                await Permission.location.isLimited ||
                await Permission.location.isRestricted) {
              Get.off(const NotificationAccessView());
            }
          })
        ],
      ),
    );
  }
}
