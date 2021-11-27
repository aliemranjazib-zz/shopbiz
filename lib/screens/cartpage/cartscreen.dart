import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopbiz/screens/checkout/checkout.dart';
import 'package:shopbiz/widgets/app_drawer.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var sum = 0;

  Future getDocs() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("cart").get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i]['phone'] == phone) {
        var a = querySnapshot.docs[i]['price'];
        // print(a);
        setState(() {
          sum = sum + a;
        });
      }
    }
    print(sum);
  }

  deleteData(String id) {
    FirebaseFirestore.instance
        .collection('cart')
        .doc(id)
        .delete()
        .then((value) => Fluttertoast.showToast(msg: 'successfully deleted'));
  }

  String phone;

  @override
  void initState() {
    getDocs();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getphone() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      phone = prefs.getString('phone');
      print("okk $phone");
      return phone;
    }

    getphone();

    return Scaffold(
        appBar: AppBar(
          title: Text("cart screen"),
        ),
        drawer: AppDrawer(),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('cart').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = snapshot.data.docs[index];

                      if (snapshot.hasError) {
                        Fluttertoast.showToast(msg: "error");
                      }
                      if (snapshot.data == null) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.data.docs[index]['phone'] == phone) {
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (d) {
                            deleteData(data.id);
                          },
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            '${data['title']}',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            'price :  ${data['price']}',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Expanded(
                                            child: Text(
                                              'quantity ${data['quantity']}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return Text("");
                    },
                  );
                },
              ),
            ),

            Container(
              width: double.infinity,
              child: Card(
                color: Colors.redAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "total payable : $sum",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  // getDocs();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CheckOutPage()));
                },
                child: Text("CHECKOUT"))

            // Expanded(
            //   child:
            // Container(
            //     width: double.infinity,
            //     child: Column(
            //       children: [
            //         Container(
            //           width: double.infinity,
            //           child: Card(
            //             child: Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text(
            //                 '$title',
            //                 style: TextStyle(fontSize: 40),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Text(
            //           'price : $price',
            //           style: TextStyle(fontSize: 40),
            //         ),
            //         Align(
            //           alignment: Alignment.bottomRight,
            //           child: Text(
            //             'quantity :  $quanity',
            //             style: TextStyle(fontSize: 30),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // ElevatedButton(onPressed: () {}, child: Text("check out"))
          ],
        ));
  }
}
