import 'package:get/get.dart';

class IamController extends GetxController {
  String pressed = '';
  void setPressed(String pressedName) {
    pressed = pressedName;
    update();
  }
}
