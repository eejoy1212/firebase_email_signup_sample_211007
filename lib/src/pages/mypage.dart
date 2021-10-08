import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('마이페이지'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome\n${FirebaseAuth.instance.currentUser!.email}'
                        // 마이페이지로 왔다는 것은 널이 없다는것 이므로 !(널 없음)사용할 수 있음
                        ),
                    ElevatedButton(
                      onPressed: FirebaseAuth.instance.signOut,
                      // ignore: prefer_const_constructors
                      child: Text('로그아웃'),
                      // ignore: prefer_const_constructors
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
