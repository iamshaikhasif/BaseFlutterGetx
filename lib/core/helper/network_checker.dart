import 'package:base_project_getx/core/constants/strings.dart';
import 'package:base_project_getx/core/helper/utilies.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkChecker {
  NetworkChecker._privateConstructor();

  static final NetworkChecker _instance = NetworkChecker._privateConstructor();

  static NetworkChecker get instance => _instance;

  final Connectivity _connectivity = Connectivity();

  void initNetwork() async {
    ConnectivityResult result = await checkConnection();
    checkStatus(result);
    _connectivity.onConnectivityChanged.listen(checkStatus);
  }

  Future<ConnectivityResult> checkConnection() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    return result;
  }

  void checkStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      AppUtility.log(StringResources.noInternetConnection);
      AppUtility.showError(
        message: StringResources.noInternetConnection,
        duration: const Duration(days: 1),
      );
    } else {
      AppUtility.log(StringResources.internetConnection);
      if (Get.isSnackbarOpen) {
        Get.closeAllSnackbars();
      }
    }
  }
}
