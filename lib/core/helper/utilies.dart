import 'package:base_project_getx/core/constants/colors.dart';
import 'package:base_project_getx/core/constants/dimens.dart';
import 'package:base_project_getx/core/constants/styles.dart';
import 'package:base_project_getx/app/data/enum/log_error_tag.dart';
import 'package:base_project_getx/core/helper/screen_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppUtility {

  static void log(String msg, {LogErrorTag tag = LogErrorTag.debug}) {
    switch(tag) {
      case LogErrorTag.info:
        ScreenInfo.talker.info(msg);
        break;
      case LogErrorTag.debug:
        ScreenInfo.talker.debug(msg);
        break;
      case LogErrorTag.verbose:
        ScreenInfo.talker.verbose(msg);
        break;
      case LogErrorTag.error:
        ScreenInfo.talker.error(msg);
        break;
      case LogErrorTag.critical:
        ScreenInfo.talker.critical(msg);
        break;
      default:
        debugPrint(msg);
        break;
    }
  }

  //show error rawSnackbar
  static void showError({required String message, Duration? duration = const Duration(seconds: 3),}) {
    if (message.isEmpty) return;
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: AppStyles.style12Normal.copyWith(color: ColorResources.whiteColor),
      ),
      /*mainButton: TextButton(
        onPressed: () {
          if (Get.isSnackbarOpen) {
            Get.back<void>();
          }
        },
        child: Text(
          StringValues.okay,
          style: AppStyles.style12Normal.copyWith(color: ColorsValues.whiteColor),
        ),
      ),*/
      duration: duration,
      backgroundColor: ColorResources.errorColor,
      margin: Dimens.edgeInsets16,
      borderRadius: Dimens.fifteen,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  static void showSuccess({required String message, Duration? duration = const Duration(seconds: 3),}) {
    if (message.isEmpty) return;
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: AppStyles.style12Normal.copyWith(color: ColorResources.whiteColor),
      ),
      /*mainButton: TextButton(
        onPressed: () {
          if (Get.isSnackbarOpen) {
            Get.back<void>();
          }
        },
        child: Text(
          StringValues.okay,
          style: AppStyles.style12Normal.copyWith(color: ColorsValues.whiteColor),
        ),
      ),*/
      duration: duration,
      backgroundColor: ColorResources.successColor,
      margin: Dimens.edgeInsets16,
      borderRadius: Dimens.fifteen,
      snackStyle: SnackStyle.FLOATING,
    );
  }
}
