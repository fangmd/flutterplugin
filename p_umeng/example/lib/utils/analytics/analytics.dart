import 'package:p_umeng_example/c.dart';

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
    if (pageName == null) return;
    // Logger.d(tag: Tag.Analytics, msg: 'beginPage $pageName');
    PUmeng.onPageStart(pageName);
  }

  static endPage(String pageName) {
    if (pageName == null) return;
    // Logger.d(tag: Tag.Analytics, msg: 'endPage $pageName');
    PUmeng.onPageEnd(pageName);
  }

  static event(String name, {String label}) {
    if (name == null) return;
    Logger.d(tag: Tag.Analytics, msg: 'event $name');
    PUmeng.onEvent(name, label: label);
  }
}
