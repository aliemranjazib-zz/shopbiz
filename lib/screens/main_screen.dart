import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopbiz/login.dart';
import 'package:shopbiz/models/categories.dart';
import 'package:shopbiz/models/usermodel.dart';
import 'package:shopbiz/profileinitpage.dart';
import 'package:shopbiz/screens/products/productspage.dart';
import 'package:shopbiz/utils/contants.dart';
import 'package:shopbiz/utils/decoration.dart';
import 'package:shopbiz/widgets/app_drawer.dart';
import 'package:shopbiz/widgets/slider.dart';

class MainPage extends StatefulWidget {
  static const id = '/mainpage';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController searchC = TextEditingController();
  List<Category> newList = List.from(categories);
  String phone;
  Future getphone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    phone = prefs.getString('phone');
    print("okk $phone");
  }

  check() {
    getphone().then((value) {
      if (phone == null) {
        Navigator.pushReplacementNamed(context, ProfileInitPage.id);
      } else {
        print('phone is not null');
      }
    });
  }

  @override
  void initState() {
    check();
    super.initState();
  }

  @override
  void dispose() {
    searchC.clear();
    super.dispose();
  }

  // @override
  // void initState() {
  //   //go();
  //   super.initState();
  // }
  AppUser appUser = AppUser();
  bool isInit = true;
  var isLoading = false;
  //check() async {
  // if (isInit) {
  //   if (await appUser.getInfoFormDb) {
  //     if (!AppUser.isLoggedIn) {
  //       //Navigator.pushReplacementNamed(context, LoginPage.id);
  //       setState(() {
  //         isLoading = false;
  //       });
  //     }
  //   } else {
  //     Navigator.pushReplacementNamed(context, ProfileInitPage.id);
  //   }
  // }
  // isInit = false;
  //}

  @override
  Widget build(BuildContext context) {
    return AppUser.userType == 0
        ? Scaffold(
            drawer: AppDrawer(),
            appBar: isLoading
                ? null
                : AppBar(
                    centerTitle: true,
                    title: Text('home page'),
                  ),
            body: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(
                      children: [
                        Container(
                          decoration: decoration(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              controller: searchC,
                              onChanged: (value) {
                                setState(() {
                                  searchC.text = value;
                                  newList = categories
                                      .where((e) => e.name
                                          .toLowerCase()
                                          .contains(value.toLowerCase()))
                                      .toList();
                                  print(searchC.text);
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'search category...',
                                suffixIcon: Icon(FontAwesomeIcons.search),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        CSlider(),
                        SizedBox(height: 20),
                        Text(
                          'CATEGORIES',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: newList
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          ProductPage.id,
                                          arguments: {
                                            "category": e.name,
                                            "icon": e.icon,
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Colors.purple,
                                                Colors.blue
                                              ]),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  e.name,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                e.icon,
                                                size: 35,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
          )
        : Scaffold(
            body: Center(
              child: Text("admin page"),
            ),
          );
  }
}
