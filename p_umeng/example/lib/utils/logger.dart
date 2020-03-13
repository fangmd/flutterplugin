import 'package:meta/meta.dart';
import 'common_function.dart';

class Logger {
  static void d({tag: 'example', @required String msg}) {
    if (isDebug()) {
      print('$tag ==> $msg');
    }
  }
}
