import 'package:flutter/material.dart';

abstract class ThemeText {
  static const TextStyle header =
      TextStyle(fontSize: 23, fontWeight: FontWeight.w600);

  static const TextStyle step =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w400);

  static const TextStyle label =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  static const TextStyle label2 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  static const TextStyle textSecondary =
      TextStyle(fontSize: 16, color: Colors.white);

  static const TextStyle textMain =
      TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600);

  static const TextStyle text3 =
      TextStyle(fontSize: 16, color: Color.fromARGB(255, 109, 109, 109));

  static const TextStyle userNameStyle =
      TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold);

  static const TextStyle buttonTextStyle =
      TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold);
}
