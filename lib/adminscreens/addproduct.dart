import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:shopbiz/models/categories.dart';
import 'package:shopbiz/models/productmodel.dart';
import 'package:shopbiz/utils/custom_colors.dart';
import 'package:shopbiz/utils/decoration.dart';
import 'package:shopbiz/utils/textstyles.dart';
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
  var brandC = TextEditingController();

  var quantityC = TextEditingController();
  var onSaleC = TextEditingController();
  var popularC = TextEditingController();
  var discountC = TextEditingController();
  bool isSale = false;
  bool isPopular = false;
  final _key = GlobalKey<FormState>();
  List<Asset> images = <Asset>[];
  List<String> imageUrls = <String>[];

  save() async {
    bool isValidate = _key.currentState.validate();
    if (isValidate) {
      await uploadImages();
      ProductModel().addProduct(ProductModel(
        category: categoryC.text,
        productName: productNameC.text,
        serialCode: serialCode.text,
        price: int.parse(priceC.text),
        weight: double.parse(weightC.text),
        brandName: brandC.text,
        quantity: int.parse(quantityC.text),
        imagesUrl: imageUrls,
        isOnSale: isSale,
        isPopular: isPopular,
      ));
    }
  }

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
            key: _key,
            child: ListView(
              children: [
                Container(
                  decoration: decoration(),
                  child: DropdownButtonFormField(
                      validator: (String v) {
                        if (v.isEmpty) {
                          return 'should not be empty';
                        }
                        return null;
                      },
                      hint: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('select category'),
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          categoryC.text = value;
                          print(categoryC.text);
                        });
                      },
                      // value: categories[0].name,
                      items: categories
                          .map((e) => DropdownMenuItem(
                              value: e.name,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  e.name,
                                ),
                              )))
                          .toList()),
                ),
                EditField(
                  validator: (String v) {
                    if (v.isEmpty) {
                      return 'should not be empty';
                    }
                    return null;
                  },
                  controller: productNameC,
                  hint: 'enter product name',
                  onsubmit: (value) {
                    setState(() {
                      productNameC.text = value;
                    });
                  },
                ),
                EditField(
                  validator: (String v) {
                    if (v.isEmpty) {
                      return 'should not be empty';
                    }
                    return null;
                  },
                  controller: serialCode,
                  hint: 'enter serail code',
                  onsubmit: (value) {
                    setState(() {
                      serialCode.text = value;
                    });
                  },
                ),
                EditField(
                  validator: (String v) {
                    if (v.isEmpty) {
                      return 'should not be empty';
                    }
                    return null;
                  },
                  controller: priceC,
                  hint: 'enter price name',
                  onsubmit: (value) {
                    setState(() {
                      priceC.text = value;
                    });
                  },
                ),
                EditField(
                  validator: (String v) {
                    if (v.isEmpty) {
                      return 'should not be empty';
                    }
                    return null;
                  },
                  controller: weightC,
                  hint: 'enter weight name',
                  onsubmit: (value) {
                    setState(() {
                      weightC.text = value;
                    });
                  },
                ),
                EditField(
                  validator: (String v) {
                    if (v.isEmpty) {
                      return 'should not be empty';
                    }
                    return null;
                  },
                  controller: brandC,
                  hint: 'enter brand name',
                  onsubmit: (value) {
                    setState(() {
                      brandC.text = value;
                    });
                  },
                ),
                EditField(
                  validator: (String v) {
                    if (v.isEmpty) {
                      return 'should not be empty';
                    }
                    return null;
                  },
                  controller: quantityC,
                  hint: 'enter quantity name',
                  onsubmit: (value) {
                    setState(() {
                      quantityC.text = value;
                    });
                  },
                ),
                Container(
                  height: 250,
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            loadAsset();
                          },
                          child: Text('pick images')),
                      Expanded(child: buildGrdiView())
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
                MaterialButton(
                  shape: StadiumBorder(),
                  onPressed: () {
                    save();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'upload product',
                      style: heading1,
                    ),
                  ),
                  color: primarycolor,
                ),
              ],
            )),
      ),
    );
  }

  loadAsset() async {
    List<Asset> resultImages = <Asset>[];
    String error = "something went wrong";
    try {
      resultImages = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: images,
      );
      setState(() {
        images = resultImages;
      });
    } catch (e) {
      error = e.toString();
      print(error);
    }
  }

  Future postImages(Asset imagefile) async {
    String filename = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseStorage db = FirebaseStorage.instance;
    await db
        .ref()
        .child("images")
        .child(filename)
        .putData((await imagefile.getByteData()).buffer.asUint8List());

    return db.ref().child("images").child(filename).getDownloadURL();
  }

  uploadImages() async {
    for (var image in images) {
      await postImages(image).then((downloadUrl) {
        imageUrls.add(downloadUrl.toString());
      }).catchError((e) {
        print(e.toString());
      });
    }
  }

  Widget buildGrdiView() {
    return Container(
        width: double.infinity,
        decoration: decoration(),
        child: images.length == 0
            ? IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
              )
            : GridView.count(
                crossAxisCount: 3,
                children: List.generate(images.length, (index) {
                  Asset asset = images[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        child:
                            AssetThumb(asset: asset, width: 150, height: 150)),
                  );
                }),
              ));
  }
}

class EditField extends StatelessWidget {
  String hint;
  Function onsubmit;
  Function validator;
  TextEditingController controller;
  EditField({
    this.hint,
    this.onsubmit,
    this.controller,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
          decoration: decoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              validator: validator,
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
