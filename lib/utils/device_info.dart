import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class Info {
  static Future<Map<String, String>> device() async {
    Map<String, String> params = {};
    var deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      params.addAll({
        'deviceId': iosDeviceInfo.identifierForVendor!,
        'deviceType': 'I',
        'deviceToken': ''
      });
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      params.addAll({
        'deviceId': androidDeviceInfo.id,
        'deviceType': 'A',
        'deviceToken': '',
      });
    }
    return params;
  }
}
