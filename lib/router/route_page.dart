import 'package:base_project_getx/app/splash/splash.dart';
import 'package:base_project_getx/router/router_name.dart';
import 'package:get/get.dart';

abstract class RoutersPage {
  static var defaultTransition = Transition.circularReveal;
  static var transitionDuration = const Duration(milliseconds: 500);

  static final pages = [
    GetPage(
      name: RoutersName.splash.name,
      page: SplashScreen.new,
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),
  ];
}
