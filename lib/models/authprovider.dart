import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopbiz/homepage.dart';
import 'package:shopbiz/screens/main_screen.dart';

class AuthProvider {
  Future<bool> loginwithPhone(BuildContext context, String phone) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    TextEditingController otpC = TextEditingController();
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (AuthCredential credential) async {
          UserCredential result = await _auth.signInWithCredential(credential);
          Navigator.pop(context);
          User user = result.user;
          if (user != null) {
            Navigator.pushReplacementNamed(context, MainPage.id);
          } else {
            Fluttertoast.showToast(msg: 'user is not signed in');
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          Fluttertoast.showToast(msg: e.toString());
        },
        codeSent: (String verficationconde, int token) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text('enter OPT'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: otpC,
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () async {
                          final code = otpC.text;
                          AuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verficationconde,
                                  smsCode: code);
                          UserCredential result =
                              await _auth.signInWithCredential(credential);
                          User user = result.user;
                          if (user != null) {
                            Navigator.pushReplacementNamed(
                                context, MainPage.id);

                            print('successs');
                          } else {
                            Fluttertoast.showToast(msg: 'error');
                          }
                        },
                        child: Text('verify'))
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (id) => {});
  }
}
