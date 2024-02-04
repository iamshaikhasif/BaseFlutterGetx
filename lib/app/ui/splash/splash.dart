import 'package:base_project_getx/app/ui/splash/splash_controller.dart';
import 'package:base_project_getx/core/constants/colors.dart';
import 'package:base_project_getx/core/helper/network_checker.dart';
import 'package:base_project_getx/core/helper/screen_info.dart';
import 'package:base_project_getx/core/helper/utilies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talker_flutter/talker_flutter.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    ScreenInfo.init(context);
    NetworkChecker.instance.initNetwork();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                //AppUtility.showSuccess(message: 'Camera Permission Error');
                AppUtility.log('Camera Permission Error');
                controller.encrypt();
              },
              child: Center(
                child: Container(
                  color: ColorResources.blackColor,
                  height: 50,
                  width: 50,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(
                  TalkerScreen(talker: ScreenInfo.talker),
                );
              },
              child: Center(
                child: Container(
                  color: ColorResources.errorColor,
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
