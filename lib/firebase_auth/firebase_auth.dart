import 'package:customize_food/signin_signup/switch_option.dart';
import 'package:customize_food/utils/showSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  //email signup
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      showSnckBar(context, "Registered Successfull !!");
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SwitchOption(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      showSnckBar(context, e.message!);
    }
  }

  //email signin
  Future<void> loginWithEmailAndPasswoord({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      showSnckBar(context, "Login Successfull !!");
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SwitchOption(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      showSnckBar(context, "Wrong Information!!");
    }
  }
}
