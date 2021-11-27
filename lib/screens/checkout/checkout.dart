import 'package:flutter/material.dart';
import 'package:shopbiz/widgets/app_drawer.dart';

class CheckOutPage extends StatelessWidget {
  TextEditingController cityc = TextEditingController();
  TextEditingController streetc = TextEditingController();
  TextEditingController countryc = TextEditingController();
  TextEditingController zipc = TextEditingController();
  final fkey = GlobalKey<FormState>();
  save() {
    if (fkey.currentState.validate()) {
      print("success");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('check out'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: fkey,
          child: Column(
            children: [
              AddressField(
                controller: cityc,
                hint: 'enter city',
              ),
              AddressField(
                controller: streetc,
                hint: 'enter streey',
              ),
              AddressField(
                controller: countryc,
                hint: 'enter country',
              ),
              AddressField(
                controller: zipc,
                hint: 'enter zip',
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      onPressed: () {
                        save();
                      },
                      child: Text("proceed to payment")))
            ],
          ),
        ),
      ),
    );
  }
}

class AddressField extends StatelessWidget {
  String hint;
  TextEditingController controller;
  AddressField({this.hint, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        validator: (v) {
          if (v.isEmpty || v.length == null) {
            return 'should not be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hint,
        ),
      ),
    );
  }
}
