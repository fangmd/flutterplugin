import 'package:flutter/material.dart';
import 'analytics.dart';

class AppAnalysis extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (route is PageRoute) {
      if (route.settings.name != null) {
        AnalyticsUtils.beginPage(route.settings.name);
      }
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (route is PageRoute) {
      if (route.settings.name != null) {
        AnalyticsUtils.endPage(route.settings.name);
      }
    }
  }
}
