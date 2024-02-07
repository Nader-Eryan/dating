import 'dart:io';

import 'package:dating/Features/profile%20details/presentatioin/manager/firebase_controller.dart';
import 'package:dating/Features/profile%20details/presentatioin/manager/profie_details_controller.dart';
import 'package:dating/core/widgets/back_arrow_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/functions/image_picker.dart';
import 'functions/image_cropper.dart';
import 'functions/safe_image_locally.dart';

/// Widget to capture and crop the image
class ImageCapture extends StatefulWidget {
  const ImageCapture({Key? key}) : super(key: key);
  @override
  createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  /// Active image file
  XFile? _imageFile;
  String? uid;
  final ProfileDetailsController _profileDetailsController = Get.find();
  final FirebaseController _firebaseController = Get.find();

  /// Remove image
  void _clear() {
    setState(() => _imageFile = null);
  }

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != null) {
        uid = event.uid;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const BackArrowAppBar(),
        // Select an image from the camera or gallery
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 100.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.photo_camera),
                  iconSize: 38,
                  onPressed: () async {
                    XFile? selected = await pickImage(ImageSource.camera);
                    setState(() {
                      _imageFile = selected;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.photo_library),
                  iconSize: 38,
                  onPressed: () async {
                    XFile? selected = await pickImage(ImageSource.gallery);
                    setState(() {
                      _imageFile = selected;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        // Preview the image and crop it
        body: ListView(
          children: <Widget>[
            if (_imageFile != null) ...[
              Image.file(File(_imageFile!.path)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                    onPressed: (() async {
                      CroppedFile? croppedImage = await cropImage(_imageFile);
                      if (croppedImage != null) {
                        setState(() {
                          _imageFile = XFile(croppedImage.path);
                        });
                      }
                    }),
                    child: const Icon(
                      Icons.crop,
                      size: 30,
                    ),
                  ),
                  TextButton(
                    onPressed: _clear,
                    child: const Icon(
                      Icons.refresh,
                      size: 30,
                    ),
                  ),
                  TextButton(
                    child: const Icon(
                      Icons.done,
                      size: 30,
                    ),
                    onPressed: () {
                      safeImagelocally(path: _imageFile!.path);
                      _profileDetailsController.setImage(
                          _imageFile!.path, _firebaseController.uid);
                      popPage();
                    }, //_saveImage
                  )
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }

  void popPage() {
    Get.back();
  }
}
