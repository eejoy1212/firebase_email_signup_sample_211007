import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_email_signup_sample_211007/src/pages/mypage.dart';
import 'package:firebase_email_signup_sample_211007/src/pages/sign_in.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> user) {
          if (user.hasData) {
            // ignore: prefer_const_constructors
            return MyPage();
          } else {
            // ignore: prefer_const_constructors
            return SignIn();
            // 회원가입 페이지
          }
        });
  }
}
