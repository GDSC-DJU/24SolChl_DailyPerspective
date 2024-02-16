import 'dart:io';
import 'dart:developer' as dev;
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

Future<void> saveScreenshot() async {
  try {
    // 스크린샷 캡처
    final screenshotController = ScreenshotController();
    final screenshotBytes = await screenshotController.capture();

    // 앱 assets 폴더 경로 가져오기
    final appDir = await getApplicationDocumentsDirectory();
    final assetsDir = Directory('${appDir.path}/assets');

    // assets 폴더가 없으면 생성
    if (!await assetsDir.exists()) {
      await assetsDir.create();
    }

    // 스크린샷 파일 저장
    final screenshotFile = File('${assetsDir.path}/screenshot.png');
    await screenshotFile.writeAsBytes(screenshotBytes as List<int>);
  } catch (e) {
    dev.log("error");
  }
}
