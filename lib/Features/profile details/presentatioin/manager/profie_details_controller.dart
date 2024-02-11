import 'package:dating/core/utils/functions/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/functions/get_image_locally.dart';
import '../../../../core/utils/image_capture.dart';

class ProfileDetailsController extends GetxController {
  String? _imgPath;
  get imgPath => _imgPath;

  late String fName, sName;
  void pickPicture(BuildContext context) {
    Get.to(const ImageCapture());
    getImage();
  }

  void getImage() async {
    _imgPath = await getProfileImage();
  }

  void setImage(String selectedImage, uid) {
    _imgPath = selectedImage;
    update();
    uploadFileRemotely(_imgPath!, uid);
  }

  void uploadImage(String filePath, String uid) {
    uploadFileRemotely(filePath, uid);
  }
}
