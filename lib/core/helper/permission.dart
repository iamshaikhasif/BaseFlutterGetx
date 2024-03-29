import 'package:base_project_getx/core/helper/utilies.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class AppPermissions {
  static Future<bool> checkStoragePermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      if (await Permission.storage.request().isGranted) {
        return true;
      }
      return false;
    }
    if (status.isRestricted) {
      AppUtility.showError(message: "Storage Permission Error");
      return false;
    }
    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }

    return true;
  }

  static Future<bool> checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      if (await Permission.camera.request().isGranted) {
        return true;
      }
      return false;
    }
    if (status.isRestricted) {
      AppUtility.showError(message: 'Camera Permission Error');
      return false;
    }
    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }
    return true;
  }

  static Future<bool> checkLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      if (await Permission.location.request().isGranted) {
        return true;
      }
      return false;
    }
    if (status.isRestricted) {
      AppUtility.showError(message: 'Location Permission Error');
      return false;
    }
    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }
    return true;
  }
}
