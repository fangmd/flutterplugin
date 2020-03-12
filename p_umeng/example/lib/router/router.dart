import 'package:flutter/material.dart';

///路由管理
class RouterUtils {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  /// 不需要 context 直接跳转
  static void pushNamedWithoutContext(String name) {
    navigatorKey.currentState.pushNamed(name);
  }

  static Future pushNamed(
    BuildContext context,
    String routeName, {
    Object arguments,
  }) {
    return Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void push(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// 自定义跳转效果
  static void pushWithRoute(BuildContext context, Route route) {
    Navigator.push(context, route);
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static void pop2({BuildContext context}) {
    if (context == null) {
      navigatorKey.currentState.pop();
    } else {
      Navigator.pop(context);
    }
  }

  /// 启动一个新的页面，并清理所有历史栈
  static void pushNamedAndRemoveAll(BuildContext context, String newRouteName) {
    Navigator.pushNamedAndRemoveUntil(context, newRouteName, (_) => false);
  }

  /// 启动一个新的页面，并清理所有历史栈
  static void pushNamedAndRemoveAll2(String newRouteName) {
    navigatorKey.currentState.pushNamedAndRemoveUntil(
      newRouteName,
      (_) => false,
    );
  }
}
