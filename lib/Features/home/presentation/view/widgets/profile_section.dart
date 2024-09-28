import 'package:dating/Features/home/presentation/view/widgets/interest_widget.dart';
import 'package:dating/constants.dart';
import 'package:dating/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: Get.height * 1.5,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/profilePic.jpg',
                  width: double.infinity,
                  height: Get.height / 2.1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            Positioned(
              top: Get.height / 2.2,
              width: Get.width,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                child: Padding(
                  padding: const EdgeInsets.all(kPagePadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jessica Parker, 23',
                                style: Styles.kH3Bold,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Professional model',
                                style: Styles.kH5,
                              ),
                            ],
                          ),
                          SvgPicture.asset('assets/images/sendBtn.svg'),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: Styles.kH4Bold,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Chicago, IL United States',
                                style: Styles.kH6,
                              ),
                            ],
                          ),
                          Container(
                            width: Get.width / 6,
                            height: Get.height / 19,
                            decoration: BoxDecoration(
                              color: Color(0xffE94057).withOpacity(.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/location_sign.svg',
                                    width: 20,
                                  ),
                                  Text(
                                    ' 1 km',
                                    style: Styles.kH6Bold
                                        .copyWith(color: kPrimaryClr),
                                  )
                                ]),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'About',
                        style: Styles.kH4Bold,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          'My name is Jessica Parker and I enjoy meeting new people and finding ways '
                          ''
                          '''to help them have an uplifting experience. I enjoy reading..'''),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Interests',
                        style: Styles.kH4Bold
                            .copyWith(fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InterestWidget(isActive: true, txt: 'Traveling'),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
