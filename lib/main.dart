import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopbiz/adminscreens/addproduct.dart';
import 'package:shopbiz/screens/main_screen.dart';
import 'package:shopbiz/utils/custom_colors.dart';
import 'package:shopbiz/homepage.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primarycolor,
        fontFamily: 'roboto-regular',
      ),
      home: AddProductPage(),
      routes: {
        SplashPage.id: (context) => SplashPage(),
        LoginPage.id: (context) => LoginPage(),
        ProfileInitPage.id: (context) => ProfileInitPage(),
        MainPage.id: (context) => MainPage(),
        AddProductPage.id: (context) => AddProductPage(),
      },
    );
  }
}
