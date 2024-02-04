import 'package:system_alert_window/system_alert_window.dart';

class Commons {
  static String getWindowGravuty(SystemWindowGravity gravity) {
    switch (gravity) {
      case SystemWindowGravity.CENTER:
        return "center";
      case SystemWindowGravity.BOTTOM:
        return "bottom";
      case SystemWindowGravity.TOP:
        return "top";
    }
  }

  static String getSystemWindowPrefMode(SystemWindowPrefMode prefMode) {
    switch (prefMode) {
      case SystemWindowPrefMode.DEFAULT:
        return "default";
      case SystemWindowPrefMode.BUBBLE:
        return "bubble";
      case SystemWindowPrefMode.OVERLAY:
        return "overlay";
    }
  }
}
