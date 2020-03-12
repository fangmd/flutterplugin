import 'package:flutter/material.dart';
import 'package:p_umeng_example/router/router.dart';
import 'dart:async';
import 'package:p_umeng_example/router/router_config.dart';
import 'package:p_umeng_example/ui/home_page.dart';
import 'package:p_umeng_example/utils/analytics/analytics.dart';

import 'utils/analytics/app_analysis.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
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
  void dispose() {
    super.dispose();
  }
}
