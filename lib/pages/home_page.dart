import 'package:flutter/material.dart';
import 'package:flutter_in_store_app_version_checker/flutter_in_store_app_version_checker.dart';
import 'package:utils/utils/dialog.dart';

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
      ),
    ));
  }

  void checkVersion() async {
    _checker.checkUpdate().then((value) => {
          if (value.canUpdate)
            {
              CustomDialog.show(
                  context,
                  'Caravan dasturini yangi versiyasi chiqdi',
                  'Iltimos dasturni yangilab oling')
            },
        });
  }
}
