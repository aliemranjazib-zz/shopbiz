import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopbiz/adminscreens/addproduct.dart';
import 'package:shopbiz/screens/main_screen.dart';
import 'package:shopbiz/utils/custom_colors.dart';
import 'package:shopbiz/utils/textstyles.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer(
        child: ListView(
          children: [
            drawerHeader(),
            drawerItems('home page', FontAwesomeIcons.home, () {
              Navigator.pushReplacementNamed(context, MainPage.id);
            }),
            drawerItems('admin page', FontAwesomeIcons.user, () {
              Navigator.pushReplacementNamed(context, AddProductPage.id);
            }),
            drawerItems('Cart', FontAwesomeIcons.shoppingCart, () {
              Navigator.pushReplacementNamed(context, AddProductPage.id);
            }),
          ],
        ),
      ),
    );
  }

  ListTile drawerItems(String title, IconData icon, GestureTapCallback onTap) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
  }

  DrawerHeader drawerHeader() {
    return DrawerHeader(
        padding: EdgeInsets.all(0.0),
        child: Container(
            color: primarycolor,
            child: Center(
              child: Text(
                'WELCOME TO SHOPBIZ',
                textAlign: TextAlign.center,
                style: heading1,
              ),
            )));
  }
}
