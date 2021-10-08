import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  Future<void> _signUp() async {
    try {
      // ignore: unused_local_variable
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: 'eejoy1212@gmail.com', password: '123456');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('패스워드 보안이 약합니다.');
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('이미 있는 이메일입니다.');
      }
      // ignore: avoid_print
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> _signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'eejoy1212@gmail.com',
        password: '123456',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: avoid_print
        print('존재하지 않는 이메일 입니다.');
      } else if (e.code == 'wrong-password') {
        // ignore: avoid_print
        print('잘못된 패스워드입니다.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('회원로그인'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: ElevatedButton(
                  onPressed: _signUp,
                  // ignore: prefer_const_constructors
                  child: Text('회원가입'),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ElevatedButton(
                  onPressed: _signIn,
                  // ignore: prefer_const_constructors
                  child: Text('로그인'),
                ),
              ),
            ),
          ],
        ));
  }
}
