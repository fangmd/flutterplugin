import 'package:flutter/material.dart';
import 'package:p_umeng_example/utils/logger.dart';
import 'navigator_manager.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);

  String getPageName();
}

abstract class BasePageState<T extends BasePage> extends State<BasePage> {
  bool _onResumed = false; //页面展示标记
  bool _onPause = false; //页面暂停标记

  @override
  void initState() {
    NavigatorManger().addWidget(this);
    onResume();
    super.initState();
  }

  @override
  void deactivate() {
    if (NavigatorManger().isSecondTop(this)) {
      if (!_onPause) {
        onPause();
      } else {
        onResume();
      }
    } else if (NavigatorManger().isTopPage(this)) {
      if (!_onPause) {
        onPause();
      }
    }
    super.deactivate();
  }

  @override
  void dispose() {
    NavigatorManger().removeWidget(this);
    _onResumed = false;
    _onPause = false;
    super.dispose();
  }

  void onForeground() {
    _onResumed = true;
    _onPause = false;
  }

  void onBackground() {
    _onPause = true;
    _onResumed = false;
  }

  void onResume() {
    _onResumed = true;
    _onPause = false;
    Logger.d(msg: "onResume ${widget.getPageName()}");
  }

  void onPause() {
    _onPause = true;
    _onResumed = false;
    Logger.d(msg: "onPause ${widget.getPageName()}");
  }
}
