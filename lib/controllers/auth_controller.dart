import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final Rxn<User> _userFirebase = Rxn<User>();
  User? get userFirebase => _userFirebase.value;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    _userFirebase.bindStream(auth.authStateChanges());
    ever(_userFirebase, _initialScreen);
    super.onInit();
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed('/connexion');
    } else {
      Get.offAllNamed('/home-page');
    }
  }

  void signUp(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Erreur creation du compte',
        e.message!,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  void signIn(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Erreur connexion',
        e.message!,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  /* void resetEmail(String newEmail) async {
    try {
      await _userFirebase.value.updateEmail(newEmail);
    } catch (e) {
      Get.snackbar(
        'Erreur changement email',
        e.toString(),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  void changePassword(String newPassword) async {
    try {
      await _userFirebase.value.updatePassword(newPassword);
    } catch (e) {
      Get.snackbar(
        'Erreur',
        e.toString(),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  } */

  void sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      Get.snackbar(
        'Erreur',
        e.toString(),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }
}
