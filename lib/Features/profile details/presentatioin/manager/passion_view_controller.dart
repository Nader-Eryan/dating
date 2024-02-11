import 'package:get/get.dart';

class PassionController extends GetxController {
  List<int> listOfPassion = [];
  void addPassion(int num) {
    listOfPassion.add(num);
    update();
  }

  void removePassion(int num) {
    listOfPassion.remove(num);
    update();
  }
}
