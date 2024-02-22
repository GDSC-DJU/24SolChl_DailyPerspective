import 'dart:io';

import 'package:photo_manager/photo_manager.dart';
import 'package:whatisthis/generate/tts.dart';

Future<File> getRecentImage() async {
  final PermissionState result = await PhotoManager.requestPermissionExtend();
  if (result.isAuth) {
    List<AssetPathEntity> list =
        await PhotoManager.getAssetPathList(type: RequestType.image);
    final assetList = await list[0].getAssetListRange(start: 0, end: 1);
    final filename = await assetList[0].file;
    if (filename != null) {
      return filename;
    } else {
      tts("null값 반환됨.");
      throw Exception("Null반환");
    }
  } else {
    tts("권한못받음");
    throw Exception("result == False");
  }
}

void checkPermission() async {
  final ps = await PhotoManager.requestPermissionExtend();
  if (ps.isAuth) {
    tts("참");
  } else {
    tts("거짓");
    PhotoManager.openSetting();
  }
}
