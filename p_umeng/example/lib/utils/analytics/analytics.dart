import '../logger.dart';
import 'package:p_umeng/p_umeng.dart';

/// 统计功能
/// umeng
class AnalyticsUtils {
  static init() {
    PUmeng.setLogEnabled(true);
    PUmeng.init(
      "5e6a262e167edd2eeb0000c0",
      '5e6a2652167edd392c00005b',
      channel: 'Example',
    );
  }

  static beginPage(String pageName) {
    Logger.d(msg: 'beginPage $pageName');
    PUmeng.onPageStart(pageName);
  }

  static endPage(String pageName) {
    Logger.d(msg: 'endPage $pageName');
    PUmeng.onPageEnd(pageName);
  }

  static event(String name, {String label}) {
    Logger.d(msg: 'event $name');
    PUmeng.onEvent(name, label: label);
  }
}
