import 'package:meta/meta.dart';
import 'common_function.dart';

class Logger {
  static void d({tag: 'Torent', @required String msg}) {
    if (isDebug()) {
      print('$tag ==> $msg');
    }
  }
}
