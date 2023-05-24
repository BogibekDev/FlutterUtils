import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FToast {
  static show(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }
}
