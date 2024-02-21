import 'package:photo_manager/photo_manager.dart';
import 'package:whatisthis/generate/tts.dart';

getRecentImage() async {
  var result = await PhotoManager.requestPermissionExtend();
  if (result.isAuth) {
    List<AssetPathEntity> list =
        await PhotoManager.getAssetPathList(type: RequestType.image);
    final assetList = await list[0].getAssetListRange(start: 0, end: 1);
    final filename = await assetList[0].file;
    if (filename != null) {
      return filename;
    } else {
      tts("null값 반환됨.");
    }
  } else {
    tts("불러오기 오류 발생.");
  }
}
