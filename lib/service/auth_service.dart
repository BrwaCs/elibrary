import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';


class AuthenticationService {
  final _auth = FirebaseAuth.instance;
  Future<AuthStatus> resetPassword({required String email,context}) async{
 dynamic _status;
    try {
      await _auth.sendPasswordResetEmail(email: email, );
       _status = AuthStatus.successful;
    } on  FirebaseAuthException catch (e) {
      _status = AuthExceptionHandler.handleAuthException(e);
    }
    return _status;
    //  _auth
    //     .sendPasswordResetEmail(email: email)
    //     .then((value) => _status = AuthStatus.successful==true 
    //     ?             ScaffoldMessenger.of(context).showSnackBar(
    //                  SnackBar(content: Text("Request is send")),)
    //     : ScaffoldMessenger.of(context).showSnackBar(
    //                  SnackBar(content: Text("Request is not send")),)
    //     )
    //     .catchError((e) => _status = AuthExceptionHandler.handleAuthException(e));
    // return _status;
  }
}



enum AuthStatus {
  successful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  unknown,
}

class AuthExceptionHandler {
  final _auth=FirebaseAuth.instance;
  static handleAuthException(FirebaseAuthException e) {
    AuthStatus status;
    switch (e.code) {
      case "invalid-email":
        status = AuthStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthStatus.wrongPassword;
        break;
      case "weak-password":
        status = AuthStatus.weakPassword;
        break;
      case "email-already-in-use":
        status = AuthStatus.emailAlreadyExists;
        break;
      default:
        status = AuthStatus.unknown;
    }
    return status;
  }
  static String generateErrorMessage(error) {
    String errorMessage;
    switch (error) {
      case AuthStatus.invalidEmail:
        errorMessage = "Your email address appears to be malformed.";
        break;
      case AuthStatus.weakPassword:
        errorMessage = "Your password should be at least 6 characters.";
        break;
      case AuthStatus.wrongPassword:
        errorMessage = "Your email or password is wrong.";
        break;
      case AuthStatus.emailAlreadyExists:
        errorMessage =
            "The email address is already in use by another account.";
        break;
      default:
        errorMessage = "An error occured. Please try again later.";
    }
    return errorMessage;
  }
}

