import 'dart:io';

class AppConfig {
  static String get baseUrl {
    if (Platform.isAndroid) {
      return 'http://10.80.130.171:8000/';
    }
    if (Platform.isIOS) {
      return 'http://127.0.0.1:8000/';
    }
    return 'https://api.yourdomain.com/';
  }
}
