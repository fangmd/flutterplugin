import 'package:flutter/material.dart';
import 'package:p_umeng_example/base/base_page.dart';
import 'package:p_umeng/p_umeng.dart';
import 'package:p_umeng_example/router/router.dart';
import 'package:p_umeng_example/ui/sec_page.dart';

class HomePage extends BasePage {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();

  @override
  String getPageName() {
    return routeName;
  }
}

class _HomePageState extends BasePageState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                RouterUtils.pushNamed(context, SecPage.routeName);
              },
              child: Text(
                'To Sec Page',
              ),
            ),
            RaisedButton(
              onPressed: () {
                PUmeng.onPageStart("Home");
                print('asasa');
              },
              child: Text(
                'Page Start',
              ),
            ),
            RaisedButton(
              onPressed: () {
                PUmeng.onPageEnd("Home");
              },
              child: Text(
                'End',
              ),
            ),
            RaisedButton(
              onPressed: () {
                PUmeng.onEvent("MyEvent2", label: "MyLabel2");
              },
              child: Text(
                'Event',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
