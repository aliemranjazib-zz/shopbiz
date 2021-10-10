import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopbiz/adminscreens/addproduct.dart';
import 'package:shopbiz/screens/main_screen.dart';
import 'package:shopbiz/screens/products/products_detail.dart';
import 'package:shopbiz/screens/products/productspage.dart';
import 'package:shopbiz/utils/custom_colors.dart';
import 'package:shopbiz/profileinitpage.dart';
import 'package:shopbiz/login.dart';
import 'package:shopbiz/splashpah.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'shop biz',
      theme: ThemeData(
        primaryColor: primarycolor,
        fontFamily: 'roboto-regular',
      ),
      home: SplashInitPage(),
      routes: {
        SplashPage.id: (context) => SplashPage(),
        LoginPage.id: (context) => LoginPage(),
        ProfileInitPage.id: (context) => ProfileInitPage(),
        MainPage.id: (context) => MainPage(),
        AddProductPage.id: (context) => AddProductPage(),
        ProductPage.id: (context) => ProductPage(),
        ProductDetailPage.id: (context) => ProductDetailPage(),
      },
    );
  }
}
