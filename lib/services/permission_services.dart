import 'package:permission_handler/permission_handler.dart';

abstract class PermissionServices {
  static Future askPermission() async {
    await Permission.storage.request();
  }
}
