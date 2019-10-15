import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:android_metadata/android_metadata.dart';

void main() {
  const MethodChannel channel = MethodChannel('android_metadata');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await AndroidMetadata.platformVersion, '42');
  });
}
