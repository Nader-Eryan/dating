import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating/core/utils/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PassionRepo {
  final String uid = getIt.get<FirebaseAuth>().currentUser!.uid;

  CollectionReference passions = FirebaseFirestore.instance.collection('users');

  Future<void> addUserPassion(List list) async {
    passions.doc(uid).update({'passions': list});
  }
}
