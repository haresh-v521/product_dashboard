import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';


class AuthClass{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Facebook auth


  // Future<UserCredential?> signInwithFacebook()async{
  //   final LoginResult result = await FacebookAuth.instance.login();
  //   final OAuthCredential facebookAuthCredential= FacebookAuthProvider.credential(result.accessToken!.token);
  //   return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }


  // Future<Null> _login() async {
  //   final FacebookLoginResult result =
  //   await FacebookAuth.logInWithReadPermissions(['email']);
  //
  //   switch (result.status) {
  //     case FacebookLoginStatus.loggedIn:
  //       final FacebookAccessToken accessToken = result.accessToken;
  //       print(accessToken.token);
  //       break;
  //     case FacebookLoginStatus.cancelledByUser:
  //       print('Login cancelled by the user.');
  //       break;
  //     case FacebookLoginStatus.error:
  //       print(result.errorMessage);
  //       break;
  //   }
  // }




// Email / Password



  get user => _auth.currentUser;

//SIGN UP METHOD
  signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN IN METHODJ
  Future<String?> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future<void> signOut() async {
    await _auth.signOut();

    print('signout');
  }


}