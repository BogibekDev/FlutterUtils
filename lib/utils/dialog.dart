import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'launch_url.dart';

class CustomDialog {
  static void show(BuildContext context, String title, String desc) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      title: title,
      desc: desc,
      btnCancelOnPress: () {
        Navigator.pop(context);
      },
      btnOkOnPress: () {
        Launch.uri(
            "https://play.google.com/store/apps/details?id=com.caravan.caravan");
      },
    ).show();
  }
}
