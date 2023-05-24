import 'package:flutter_in_store_app_version_checker/flutter_in_store_app_version_checker.dart';
import 'package:utils/utils/log.dart';

class CheckVersion {
  static void checkVersion(InStoreAppVersionChecker checker) async {
    checker.checkUpdate().then((value) {
      Log.d(value.appURL ?? ""); // return the app url
      Log.d(value.canUpdate.toString()); // return true if update is available
      Log.d(value.currentVersion); // return current app version
      Log.d(value.errorMessage ?? ""); // return error message if found else it will return null
      Log.d(value.newVersion ?? ""); // return the new app version
    });
  }
}
