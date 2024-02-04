import 'package:base_project_getx/app/data/services/get_di.dart';
import 'package:base_project_getx/core/constants/colors.dart';
import 'package:base_project_getx/core/constants/strings.dart';
import 'package:base_project_getx/router/route_page.dart';
import 'package:base_project_getx/router/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: StringResources.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: ColorResources.whiteColor,
            colorScheme: ColorScheme.fromSeed(seedColor: ColorResources.primaryColor),
            useMaterial3: true,
          ),
          initialBinding: DiBinding(),
          getPages: RoutersPage.pages,
          initialRoute: RoutersName.splash,

        );
      },
      child: const SizedBox(),
    );
  }
}
