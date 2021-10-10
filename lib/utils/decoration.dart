import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

BoxDecoration decoration() {
  return BoxDecoration(
    color: Colors.grey.withOpacity(0.3),
    borderRadius: BorderRadius.circular(10),
  );
}

Icon person = Icon(FontAwesomeIcons.user);
Icon adress = Icon(FontAwesomeIcons.addressBook);
Icon dob = Icon(FontAwesomeIcons.calendar);
