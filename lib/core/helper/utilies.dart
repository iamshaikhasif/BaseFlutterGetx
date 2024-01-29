import 'package:base_project_getx/core/constants/dimens.dart';
import 'package:base_project_getx/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppUtility {
  static void log(String msg) {
    debugPrint(msg);
  }

  //show error snackbar

  static void showError(String message) {
    // closeSnackBar();
    // closeBottomSheet();
    if (message.isEmpty) return;
    Get.rawSnackbar(
      messageText: Text(
        message,
      ),
      mainButton: TextButton(
        onPressed: () {
          if (Get.isSnackbarOpen) {
            Get.back<void>();
          }
        },
        child: const Text(
          StringValues.okay,
        ),
      ),
      backgroundColor: const Color(0xFF503E9D),
      margin: Dimens.edgeInsets16,
      borderRadius: Dimens.fifteen,
      snackStyle: SnackStyle.FLOATING,
    );
  }
}
