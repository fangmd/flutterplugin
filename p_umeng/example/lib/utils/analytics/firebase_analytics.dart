//import 'package:flutter/material.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
//import 'package:firebase_analytics/observer.dart';
//import 'package:firebase_crashlytics/firebase_crashlytics.dart';
//
///// Firebase relate
///// 统计
///// 错误收集
//class FirebaseUtils {
//  static FirebaseAnalytics analytics = FirebaseAnalytics();
//
//  static FirebaseAnalyticsObserver observer =
//      FirebaseAnalyticsObserver(analytics: analytics);
//
//  static init() {
//    Crashlytics.instance.enableInDevMode = false;
//    // Pass all uncaught errors to Crashlytics.
//    FlutterError.onError = Crashlytics.instance.recordFlutterError;
//  }
//}
