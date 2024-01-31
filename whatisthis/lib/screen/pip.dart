import 'package:flutter_in_app_pip/flutter_in_app_pip.dart';
import 'package:whatisthis/screen/next.dart';

void pip() {
  PictureInPicture.startPiP(
      pipWidget: PiPWidget(
    child: nextscreen(),
    onPiPClose: () {
      //Handle closing events e.g. dispose controllers.
    },
    elevation: 50, //Optional
    pipBorderRadius: 10, //Optional
  ));
}
