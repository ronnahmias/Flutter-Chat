import 'package:chat_app/widgets/auth/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  void _submitAuthForm(
    String email,
    String username,
    String password,
    bool isLogin,
  ) async {
    User authResult;
    try {
      if (isLogin) {
        authResult = (await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        ))
            .user;
      } else {
        authResult = (await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ))
            .user;
      }
    } on PlatformException catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm),
    );
  }
}
