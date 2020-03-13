import 'package:flutter/material.dart';
import 'package:p_umeng_example/base/base_page.dart';

class SecPage extends BasePage {
  static const routeName = '/Sec';

  @override
  _SecPageState createState() => _SecPageState();

  @override
  String getPageName() {
    return routeName;
  }
}

class _SecPageState extends BasePageState<SecPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Text('Second Page'),
      ),
    );
  }
}
