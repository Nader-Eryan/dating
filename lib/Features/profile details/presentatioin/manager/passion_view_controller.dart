import 'package:get/get.dart';

class PassionController extends GetxController {
  String pressed = '';
  void setPressed(String pressedName) {
    pressed = pressedName;
    update();
  }
}
