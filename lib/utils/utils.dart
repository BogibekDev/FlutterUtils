import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  static Future<void> launchURL(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<Map<String, String>> deviceParams() async {
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
