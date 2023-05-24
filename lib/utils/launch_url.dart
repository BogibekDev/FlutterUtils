import 'package:url_launcher/url_launcher.dart';

class Launch {
  static Future<void> uri(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    } else {
      throw 'Could not launch $url';
    }
  }
}
