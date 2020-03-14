import 'package:flutter/material.dart';
import 'package:p_umeng_example/router/router.dart';
import 'dart:async';
import 'package:p_umeng_example/router/router_config.dart';
import 'package:p_umeng_example/ui/home_page.dart';
import 'package:p_umeng_example/utils/analytics/analytics.dart';
import 'package:p_umeng_example/utils/logger.dart';

import 'utils/analytics/app_analysis.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () {
      initUmeng();
    });
  }

  Future<void> initUmeng() async {
    AnalyticsUtils.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RouterUtils.navigatorKey,
      title: 'P_uemng',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: buildRoutes(),
      navigatorObservers: [
        AppAnalysis(),
      ],
      home: Builder(
        builder: (context) {
          return HomePage();
        },
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _appResume();
    } else if (state == AppLifecycleState.paused) {
      _appPause();
    }
    super.didChangeAppLifecycleState(state);
  }

  void _appResume() {
    Logger.d(msg: "onForeground ");
  }

  void _appPause() {
    Logger.d(msg: "onBackground ");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
