import 'package:base_project_getx/app/ui/splash/splash.dart';
import 'package:base_project_getx/router/router_name.dart';
import 'package:get/get.dart';

abstract class RoutersPage {
  static var defaultTransition = Transition.circularReveal;
  static var transitionDuration = const Duration(milliseconds: 500);

  static final pages = [
    GetPage(
      name: RoutersName.splash,
      page: SplashScreen.new,
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),
  ];
}
