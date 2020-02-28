import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/services.dart';

class PInstall {
  static const MethodChannel _channel = const MethodChannel('p_install');

  static const INSTALL = 'install';

  static Future<String> install({String filePath, String iosUrl}) async {
    if (Platform.isAndroid) {
      if (filePath != null) {
        return _channel.invokeMethod(INSTALL, {'filePath': filePath});
      }
    } else {
      if (iosUrl != null) {
        return _channel.invokeMethod(INSTALL, {'url': iosUrl});
      }
    }
    return "params error or not support platform";
  }
}
