import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatisthis/screen/utils/commons.dart';
import 'package:whatisthis/screen/utils/constants.dart';

enum SystemWindowGravity { TOp, BOTTOM, CENTER }

enum SystemWindowPrefMode { DEFAULT, OVERLAY, BUBBLE }

class SystemAlertwindow {
  static const MethodChannel _channel =
      const MethodChannel(Constants.CHANNEL, JSONMethodCodec());

  static const BasicMessageChannel _overlaymessageChannel =
      BasicMessageChannel(Constants.MESSAGE_CHANNEL, JSONMessageCodec());

  static final StreamController _controller = StreamController();

  static Future<String?> get PlatformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String?> get getLogFile async {
    return await _channel.invokeMethod('getLogFile');
  }

  static Future<void> enableLogs(bool flag) async {
    await _channel.invokeMethod('enableLogs', {flag});
  }
}
