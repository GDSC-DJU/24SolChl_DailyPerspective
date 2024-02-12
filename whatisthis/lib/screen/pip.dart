import 'package:dash_bubble/dash_bubble.dart';
import 'dart:developer';
import 'package:flutter/material.dart';

//pip 요청
Future<void> requestOverlay() async {
  final isGranted = await DashBubble.instance.hasOverlayPermission();
  if (!isGranted) {
    await DashBubble.instance.hasOverlayPermission();
  }
}

//pip시작
Future<void> startBubble({
  BubbleOptions? bubbleOptions,
  VoidCallback? onTap,
}) async {
  final hasStarted = await DashBubble.instance.startBubble(
    bubbleOptions: bubbleOptions,
    onTap: onTap,
  );
  if (hasStarted == true) {
    print("Bubble is started");
  } else {
    print("Bubble is not started");
  }
}

logMessage({required String message}) {
  log(message);
}

//pip닫기
Future<void> stopBubble() async {
  final hasStoped = await DashBubble.instance.stopBubble();
  if (hasStoped == true) {
    print("close Bubble");
  } else {
    print("not close Bubble");
  }
}
