import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dating/Features/Account/data/repos/profile_repo.dart';
import 'package:dating/Features/home/presentation/view/home_view.dart';
import 'package:dating/core/utils/functions/push_snack.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/utils/service_locator.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await getIt.get<FirebaseAuth>().signInWithCredential(credential);
  }

  @override
  Future<void> signInUser(
      BuildContext context, String email, String password) async {
    try {
      await getIt
          .get<FirebaseAuth>()
          .signInWithEmailAndPassword(email: email, password: password);
      // pushSnackBar(context, S.of(context).SignedInSuccessfullyEnjoy);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        pushSnackBar(
            context, 'No user found for that email', ContentType.failure);
      } else if (e.code == 'wrong-password') {
        pushSnackBar(context, 'Wrong password provided for that user',
            ContentType.failure);
      }
    }
  }

  @override
  Future<void> registerUser(
      BuildContext context, String email, String password) async {
    try {
      await getIt.get<FirebaseAuth>().createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
      // pushSnackBar(context, S.of(context).RegisteredSuccessfullyEnjoy);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        pushSnackBar(context, 'The password is too weak', ContentType.warning);
      } else if (e.code == 'email-already-in-use') {
        pushSnackBar(
            context, 'The account already exists', ContentType.warning);
      }
    } catch (e) {
      pushSnackBar(context, '$e', ContentType.failure);
    }
  }

  @override
  Future<void> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    if (loginResult.accessToken != null) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      // Once signed in, return the UserCredential
      getIt.get<FirebaseAuth>().signInWithCredential(facebookAuthCredential);
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await getIt.get<FirebaseAuth>().sendPasswordResetEmail(email: email);
  }

  @override
  void navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeView()));
  }

  @override
  Future<void> urlLauncher(String url) async {
    Uri parsedUrl = Uri.parse(url);
    if (!await launchUrl(parsedUrl)) {
      throw Exception('Could not launch $url');
    }
  }
}
