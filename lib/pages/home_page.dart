import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_in_store_app_version_checker/flutter_in_store_app_version_checker.dart';
import 'package:utils/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _checker = InStoreAppVersionChecker(
    appId: 'com.caravan.caravan',
    currentVersion: '0.1',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            checkVersion();
          },
          color: Colors.green,
          child: const Text(
            "Check version",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ) ,
      )
    );
  }

  void checkVersion() async {
    _checker.checkUpdate().then((value) => {
          if (value.canUpdate)
            {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.rightSlide,
                title: 'Caravan dasturini yangi versiyasi chiqdi',
                desc: 'Iltimos dasturni yangilab oling',
                btnCancelOnPress: () {
                  Navigator.pop(context);
                },
                btnOkOnPress: () {
                  Utils.launchURL(
                    Uri.parse(
                      "https://play.google.com/store/apps/details?id=com.caravan.caravan",
                    ),
                  );

                },
              )..show(),
            },
        });
  }
}
