import 'package:p_umeng/p_umeng.dart';
import 'package:flutter/material.dart';
import 'dart:async';

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
    PUmeng.setLogEnabled(true);
    PUmeng.init("5b7fc0558f4a9d19e600004e");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
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
                  PUmeng.onEvent("MyEvent", label: "MyLabel");
                },
                child: Text(
                  'Event',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
