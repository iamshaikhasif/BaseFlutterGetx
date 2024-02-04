
import 'package:base_project_getx/app/data/models/response/encryption_response.dart';
import 'package:base_project_getx/app/data/services/data_repositry.dart';
import 'package:base_project_getx/app/ui/splash/splash_repo.dart';
import 'package:base_project_getx/core/helper/utilies.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  final DataRepository _repository;
  SplashController(DataRepository dataRepository): _repository = dataRepository;

  void encrypt() async  {
    List<EncryptionResponseData> list = await _repository.encryptionDecryption(data: ["asif"]);
    AppUtility.log("encryption list ---> ${list[0]}");
  }

}