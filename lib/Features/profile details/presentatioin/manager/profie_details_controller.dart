import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/functions/get_image_locally.dart';
import '../../../../core/utils/image_capture.dart';

class ProfileDetailsController extends GetxController {
  final RxString _imgPath = ''.obs;
  get imgPath => _imgPath;

  void pickPicture(BuildContext context) {
    Get.to(const ImageCapture());
    getImage();
  }

  void getImage() async {
    String? tmp = await getProfileImage();
    _imgPath.value = tmp ?? '';
  }
}
