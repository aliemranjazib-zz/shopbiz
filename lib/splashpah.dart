import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/homepage.dart';
import 'package:shopbiz/login.dart';
import 'package:shopbiz/screens/main_screen.dart';

class SplashInitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashPage();
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return LoginPage();
          } else if (snapshot.data.phoneNumber != null) {}

          return SplashPage();
        },
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  static const id = '/SplashPage';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer _timer;
  @override
  void initState() {
    _timer = Timer(Duration(seconds: 3), () async {
      await Navigator.pushReplacementNamed(context, MainPage.id);
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset('images/logo.png'),
          )),
          Text('SHOPBIZ',
              style: TextStyle(fontSize: 30, fontFamily: 'roboto-bold')),
          Expanded(
              child: Center(
            child: CircularProgressIndicator(),
          )),
        ],
      ),
    );
  }
}
