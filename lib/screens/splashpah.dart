import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/homepage.dart';
import 'package:shopbiz/screens/login/login.dart';

class SplashPage extends StatefulWidget {
  static const id = '/SplashPage';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer _timer;
  @override
  void initState() {
    goto();
    super.initState();
  }

  void goto() {
    _timer = Timer(Duration(seconds: 3), () async {
      await Navigator.pushReplacementNamed(context, HomePage.id);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    // TODO: implement dispose
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
