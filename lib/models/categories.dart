import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  String name;
  IconData icon;
  Category({@required this.name, @required this.icon});
}

List<Category> categories = [
  Category(
    name: 'Accessories',
    icon: FontAwesomeIcons.tshirt,
  ),
  Category(
    name: 'AutoMobiles',
    icon: FontAwesomeIcons.car,
  ),
  Category(
    name: 'Beauty and Health',
    icon: FontAwesomeIcons.hatCowboy,
  ),
  Category(
    name: 'Business & Industrial',
    icon: FontAwesomeIcons.cashRegister,
  ),
  Category(
    name: 'Book and Learning',
    icon: FontAwesomeIcons.book,
  ),
  Category(
    name: 'Computer and Peripherals ',
    icon: FontAwesomeIcons.laptop,
  ),
  Category(
    name: 'Electronics ',
    icon: FontAwesomeIcons.tv,
  ),
];
