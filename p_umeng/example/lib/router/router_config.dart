import 'package:flutter/material.dart';
import 'package:p_umeng_example/ui/home_page.dart';
import 'package:p_umeng_example/ui/sec_page.dart';
import 'package:p_umeng_example/ui/third_page.dart';

Map<String, WidgetBuilder> buildRoutes() {
  return {
    HomePage.routeName: (_) => HomePage(),
    SecPage.routeName: (_) => SecPage(),
    ThirdPage.routeName: (_) => ThirdPage(),
  };
}
