import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

final ScreenshotController screenshotController = ScreenshotController();

Future<void> captureScreenshot() async {
  try {
    // Screenshot 캡처
    Uint8List? imageUint8List = await screenshotController.capture();

    // 이미지 데이터를 파일로 저장
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String filePath = '$appDocPath/screenshot.png';
    File file = File(filePath);
    await file.writeAsBytes(imageUint8List!);
  } catch (e) {
    //에러
  }
}
