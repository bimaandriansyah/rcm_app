import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailFC = TextEditingController();
  final passwordFC = TextEditingController();
  var onShow = true.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  Stream<User?> authStatus() {
    return _auth.authStateChanges();
  }

  void showPassword() {
    this.onShow.value = !this.onShow.value;
  }

  Future<void> pressLogin() async {
    Get.focusScope?.unfocus();
    if (this.formKey.currentState!.validate()) {
      try {
        await _auth.signInWithEmailAndPassword(
            email: emailFC.text, password: passwordFC.text);
        return null;
      } on FirebaseAuthException catch (e) {
        formKey.currentState!.reset();
        this.passwordFC.text = '';
        Get.snackbar('RCM APPS', 'Email atau Password Salah',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: EdgeInsets.all(20));
      }
    }
  }

  Future signOut() async {
    await _auth.signOut();
    Get.back();
    Get.back();
  }
}
