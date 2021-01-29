import 'dart:async';

import 'package:flutter/services.dart';

class AndroidMetadata {
  static const MethodChannel _channel =
  const MethodChannel('plugins.mianjiajia.com/android_metadata');

  static Future<Map<String, String>> get metaDataAsMap async {
    final Map<String, String> metaDataMap =
    await _channel.invokeMapMethod('getMetaDataAsMap');
    return metaDataMap;
  }
}
