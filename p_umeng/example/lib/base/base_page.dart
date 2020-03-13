import 'package:flutter/material.dart';
import 'package:p_umeng_example/utils/logger.dart';
import 'navigator_manager.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);

  String getPageName();
}

abstract class BasePageState<T extends BasePage> extends State<BasePage>
    with WidgetsBindingObserver {
  bool _onResumed = false; //页面展示标记
  bool _onPause = false; //页面暂停标记

  @override
  void initState() {
    NavigatorManger().addWidget(this);
    WidgetsBinding.instance.addObserver(this);
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
    WidgetsBinding.instance.removeObserver(this);
    NavigatorManger().removeWidget(this);
    _onResumed = false;
    _onPause = false;
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //此处可以拓展 是不是从前台回到后台
    if (state == AppLifecycleState.resumed) {
      //on resume
      if (NavigatorManger().isTopPage(this)) {
        onForeground();
        onResume();
      }
    } else if (state == AppLifecycleState.paused) {
      //on pause
      if (NavigatorManger().isTopPage(this)) {
        onBackground();
        onPause();
      }
    }
    super.didChangeAppLifecycleState(state);
  }

  void onForeground() {
    _onResumed = true;
    _onPause = false;
    Logger.d(msg: "onForeground ${widget.getPageName()}");
  }

  void onResume() {
    _onResumed = true;
    _onPause = false;
    Logger.d(msg: "onResume ${widget.getPageName()}");
  }

  void onBackground() {
    _onPause = true;
    _onResumed = false;
    Logger.d(msg: "onBackground ${widget.getPageName()}");
  }

  void onPause() {
    _onPause = true;
    _onResumed = false;
    Logger.d(msg: "onPause ${widget.getPageName()}");
  }
}
