import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/models/categories.dart';
import 'package:shopbiz/utils/decoration.dart';
import 'package:shopbiz/widgets/app_drawer.dart';

class AddProductPage extends StatefulWidget {
  static const id = 'addproduct';

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  var categoryC = TextEditingController();
  var productNameC = TextEditingController();
  var serialCode = TextEditingController();
  var priceC = TextEditingController();
  var weightC = TextEditingController();
  var quantityC = TextEditingController();
  var onSaleC = TextEditingController();
  var popularC = TextEditingController();
  var discountC = TextEditingController();
  bool isSale = false;
  bool isPopular = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('add product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
            child: ListView(
          children: [
            Container(
              decoration: decoration(),
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      categoryC.text = value;
                      print(categoryC.text);
                    });
                  },
                  value: categories[0].name,
                  items: categories
                      .map((e) => DropdownMenuItem(
                          value: e.name,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              e.name,
                            ),
                          )))
                      .toList()),
            ),
            EditField(
              controller: productNameC,
              hint: 'enter product name',
              onsubmit: (value) {
                setState(() {
                  productNameC.text = value;
                });
              },
            ),
            EditField(
              controller: serialCode,
              hint: 'enter serail code',
              onsubmit: (value) {
                setState(() {
                  serialCode.text = value;
                });
              },
            ),
            EditField(
              controller: priceC,
              hint: 'enter price name',
              onsubmit: (value) {
                setState(() {
                  priceC.text = value;
                });
              },
            ),
            EditField(
              controller: weightC,
              hint: 'enter weight name',
              onsubmit: (value) {
                setState(() {
                  weightC.text = value;
                });
              },
            ),
            EditField(
              controller: quantityC,
              hint: 'enter quantity name',
              onsubmit: (value) {
                setState(() {
                  quantityC.text = value;
                });
              },
            ),
            Container(
              height: 200,
              decoration: decoration(),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5, mainAxisSpacing: 5, crossAxisCount: 4),
                children: [
                  Center(
                      child: Container(
                          height: 60,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black26,
                          ),
                          child: Center(child: Text("+")))),
                  Center(
                      child: Container(
                          height: 60,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black26,
                          ),
                          child: Center(child: Text("+")))),
                  Center(
                      child: Container(
                          height: 60,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black26,
                          ),
                          child: Center(child: Text("+")))),
                  Center(
                      child: Container(
                          height: 60,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black26,
                          ),
                          child: Center(child: Text("+")))),
                ],
              ),
            ),
            SwitchListTile(
                title: Text('is this product popular'),
                value: isPopular,
                onChanged: (v) {
                  setState(() {
                    isPopular = v;
                  });
                }),
            SwitchListTile(
                title: Text('is this on Sale'),
                value: isSale,
                onChanged: (v) {
                  setState(() {
                    isSale = v;
                  });
                }),
          ],
        )),
      ),
    );
  }
}

class EditField extends StatelessWidget {
  String hint;
  Function onsubmit;
  TextEditingController controller;
  EditField({this.hint, this.onsubmit, this.controller});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
          decoration: decoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: controller,
              onFieldSubmitted: onsubmit,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
              ),
            ),
          )),
    );
  }
}
