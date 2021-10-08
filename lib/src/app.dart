// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_email_signup_sample_211007/src/pages/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        //initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // check for errors
          if (snapshot.hasError) {
            return Center(
              child: Text('Firebase Init Fail'),
            );
          }
          // once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return Home();
          }
          // otherwise, show something whilst wating for initialization to complete
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
