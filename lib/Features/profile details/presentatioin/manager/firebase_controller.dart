import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseController extends GetxController {
  late String uid;
  @override
  void onInit() {
    uid = FirebaseAuth.instance.currentUser!.uid;
    super.onInit();
  }
}
