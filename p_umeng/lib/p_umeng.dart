import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

class PUmeng {
  static const MethodChannel _channel = const MethodChannel('p_umeng');

  /// [key] 【友盟+】Appkey名称
  /// [channel] 渠道
  /// [mode] 页面采集的两种模式：0表示Android 4.0及以上版本,1表示4.0以下版本，默认为1
  /// [reportCrash] 错误统计，默认为打开
  /// [encrypt] 日志加密 默认为false
  /// [interval] Session间隔时长,单位是毫秒，默认Session间隔时间是30秒,一般情况下不用修改此值
  static Future<bool> init(
    String androidKey,
    String iosKey, {
    String channel = "official",
    int mode = 1,
    bool reportCrash = true,
    bool encrypt = false,
    double interval = 30000,
  }) {
    Map<String, dynamic> args = {};

    if (Platform.isAndroid) {
      args['key'] = androidKey;
    } else {
      args['key'] = iosKey;
    }

    if (mode != null) {
      args["mode"] = mode;
    }
    if (reportCrash != null) {
      args["reportCrash"] = reportCrash;
    }
    if (encrypt != null) {
      args["encrypt"] = encrypt;
    }
    if (interval != null) {
      args["interval"] = interval;
    }
    args["channel"] = channel;
    _channel.invokeMethod("init", args);
    return Future.value(true);
  }

  /// 是否开启日志
  /// [flag] 设置组件化的Log开关，参数默认为false，如需查看LOG设置为true
  static Future<Null> setLogEnabled(bool flag) async {
    _channel.invokeMethod("setLogEnabled", {"flag": flag});
  }

  /// 打开页面时进行统计
  /// [name]
  static Future<Null> onPageStart(String name) async {
    _channel.invokeMethod("onPageStart", {"name": name});
  }

  /// 关闭页面时结束统计
  /// [name]
  static Future<Null> onPageEnd(String name) async {
    _channel.invokeMethod("onPageEnd", {"name": name});
  }

  /// 计数事件统计
  /// [eventId]  当前统计的事件ID
  /// [label] 事件的标签属性
  static Future<Null> onEvent(String eventId, {String label}) async {
    _channel.invokeMethod("onEvent", {
      "eventId": eventId,
      "label": label,
    });
  }
}
