import 'dart:async';

import 'package:flutter/services.dart';

class Deviceinfo {
  static const MethodChannel _channel =
      const MethodChannel('deviceinfo');

  static Future<String> get systemVersion async {
    final String version = await _channel.invokeMethod('getSystemVersion');
    return version;
  }

  static Future<String> get batteryLevel async {
    final String version = await _channel.invokeMethod('getBatteryLevel');
    return version;
  }

}
