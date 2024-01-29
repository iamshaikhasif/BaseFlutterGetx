import 'package:base_project_getx/core/constants/colors.dart';
import 'package:base_project_getx/core/constants/strings.dart';
import 'package:base_project_getx/router/route_page.dart';
import 'package:base_project_getx/router/router_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StringValues.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsValues.whiteColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: RoutersPage.pages,
      initialRoute: RoutersName.splash.name,
      home: Container(),
    );
  }
}
