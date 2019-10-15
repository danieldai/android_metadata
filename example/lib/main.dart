import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:android_metadata/android_metadata.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  Map<String, String> _metadata = Map();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    Map<String, String> metadata = Map();

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await AndroidMetadata.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    try {
      metadata = await AndroidMetadata.metaDataAsMap;
    } on PlatformException {
      ;
    }


    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _metadata = metadata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_metadata\n'),
        ),
      ),
    );
  }
}
