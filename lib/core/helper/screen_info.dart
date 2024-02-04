import 'dart:io';

import 'package:base_project_getx/core/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:talker_flutter/talker_flutter.dart';

class ScreenInfo {

  static double deviceWidth = 0.0;
  static double deviceHeight = 0.0;
  static Size deviceSize = const Size(0, 0);
  static String source = StringResources.android;
  static String appVersion = StringResources.appVersion;
  static String mobileBrand = "";
  static String mobileModel = "";
  static String mobileVersion = "";
  static late Talker talker;

  static init(BuildContext context) async {
    talker = TalkerFlutter.init();
    deviceSize = MediaQuery.of(context).size;
    deviceWidth = deviceSize.width;
    deviceHeight = deviceSize.height;

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if(Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      source = StringResources.android;
      mobileBrand = androidInfo.brand;
      mobileModel = androidInfo.model;
      mobileVersion = androidInfo.version.release;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      source = StringResources.ios;
      mobileBrand = iosInfo.name;
      mobileModel = iosInfo.model;
      mobileVersion = iosInfo.systemVersion;
    }
  }


}