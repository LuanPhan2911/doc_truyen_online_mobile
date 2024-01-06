import 'package:flutter/material.dart';

class AppColor {
  static const appBar = Colors.black;
  static const background = Colors.black12;
  static const blue = Colors.blue;
  static const white = Colors.white;
  static const black = Colors.black;
  static const grey = Colors.grey;
  static const dart = Colors.black26;
  static const red = Colors.redAccent;
  static const green = Colors.green;

  static final textBtnBlack = TextButton.styleFrom(
    backgroundColor: black,
    foregroundColor: white,
  );
  static final textBtnBlue = TextButton.styleFrom(
    backgroundColor: blue,
    foregroundColor: white,
  );
  static final textBtnGrey = TextButton.styleFrom(
    backgroundColor: grey,
    foregroundColor: black,
  );
  static final iconBtnBlue = IconButton.styleFrom(
    backgroundColor: blue,
    foregroundColor: white,
  );
  static final textBoxBlue = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: blue,
  );
  static const textBoxBlack = BoxDecoration(
    color: black,
  );
}
