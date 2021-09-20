import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/login.dart';

class ProfileInitPage extends StatelessWidget {
  static const id = '/HomePage';

  Future signout(BuildContext context) async {
    await FirebaseAuth.instance.signOut().whenComplete(
          () => Navigator.pushReplacementNamed(context, LoginPage.id),
        );
  }

  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController houseC = TextEditingController();
  TextEditingController streetC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  TextEditingController provinceC = TextEditingController();
  TextEditingController countryC = TextEditingController();

  final formkey = GlobalKey<FormState>();

  submit() {
    if (formkey.currentState.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('home page'),
        actions: [
          IconButton(
            onPressed: () {
              signout(context);
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Card(
                child: Form(
                    key: formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: nameC,
                              validator: (v) {
                                if (v.length < 4) {
                                  return 'should be greater than 5';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'enter name',
                                  labelText: 'what people call you?',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: emailC,
                              validator: (v) {
                                if (v.length < 4) {
                                  return 'should be greater than 5';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'enter email',
                                  labelText: 'what is your email?',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: houseC,
                              validator: (v) {
                                if (v.length < 4) {
                                  return 'should be greater than 5';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'enter house no.',
                                  labelText: 'enter house no.',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: streetC,
                              validator: (v) {
                                if (v.length < 4) {
                                  return 'should be greater than 5';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'enter street',
                                  labelText: 'enter street',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: cityC,
                              validator: (v) {
                                if (v.length < 4) {
                                  return 'should be greater than 5';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'enter city',
                                  labelText: 'what city',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: provinceC,
                              validator: (v) {
                                if (v.length < 4) {
                                  return 'should be greater than 5';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'enter province name',
                                  labelText: 'enter province name',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: countryC,
                              validator: (v) {
                                if (v.length < 4) {
                                  return 'should be greater than 5';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'enter country name',
                                  labelText: 'entry country name',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    submit();
                  },
                  child: Icon(Icons.navigate_next),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
