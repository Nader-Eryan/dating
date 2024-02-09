import 'package:get/get.dart';

class ProfileDetailsThreeController extends GetxController {
  String pressed = '';
  void setPressed(String pressedName) {
    pressed = pressedName;
    update();
  }
}
