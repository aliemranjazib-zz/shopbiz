import 'package:flutter/material.dart';
import 'package:shopbiz/authprovider.dart';
import 'package:shopbiz/custom_colors.dart';

class LoginPage extends StatelessWidget {
  static const id = '/LoginPage';
  GlobalKey formkey = GlobalKey<FormState>();
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.png',
              height: 200,
            ),
            SizedBox(
              height: 100,
            ),
            Text('SHOPBIZ',
                style: TextStyle(fontSize: 30, fontFamily: 'roboto-bold')),
            SizedBox(
              height: 20,
            ),
            Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: inputController,
                          decoration: InputDecoration(
                            hintText: 'enter phone number',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      minWidth: double.infinity,
                      color: primarycolor,
                      onPressed: () {
                        if (inputController.text != null) {
                          final phone = '+92' + inputController.text;
                          AuthProvider().loginwithPhone(context, phone);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(color: white, fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
