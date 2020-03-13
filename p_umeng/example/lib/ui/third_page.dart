import 'package:flutter/material.dart';
import 'package:p_umeng_example/base/base_page.dart';

class ThirdPage extends BasePage {
  static const routeName = '/third';

  @override
  _ThirdPageState createState() => _ThirdPageState();

  @override
  String getPageName() {
    return routeName;
  }
}

class _ThirdPageState extends BasePageState<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Text('Thirdond Page'),
      ),
    );
  }
}
