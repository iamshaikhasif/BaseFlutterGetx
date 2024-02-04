import 'package:base_project_getx/core/network/api_client.dart';
import 'package:base_project_getx/app/data/models/request/encryption_request.dart';
import 'package:base_project_getx/app/data/models/response/encryption_response.dart';
import 'package:base_project_getx/core/constants/type_def.dart';
import 'package:base_project_getx/app/data/models/custom_data/failure.dart';
import 'package:base_project_getx/core/helper/utilies.dart';
import 'package:base_project_getx/core/network/api_urls.dart';
import 'package:fpdart/fpdart.dart';

class DataRepository {
  final ApiClient apiClient;

  DataRepository(this.apiClient);

  Future<List<EncryptionResponseData>> encryptionDecryption(
      {required List<String> data, bool decryptionEnable = false}) async {
    List<EncryptionResponseData> result = [];
    EncryptionRequestModel request = EncryptionRequestModel(str: data);
    Either<Failure, EncryptionResponseModel> enc = decryptionEnable
        ? await decryption(request: request)
        : await encryption(request: request);

    enc.fold(
      (l) => AppUtility.log(l.message),
      (r) async {
        result = r.data ?? [];
      },
    );
    return result;
  }

  FutureEither<EncryptionResponseModel> encryption({required EncryptionRequestModel request}) async {
    try {
      final response = await apiClient.postApi(
          endPoint: ApiUrls.rsaEncryptKey, body: request);
      return right(EncryptionResponseModel.fromJson(response));
    } catch (e, stackTrace) {
      AppUtility.log("response error ${e.toString()}");
      return left(
        Failure(e.toString()),
      );
    }
  }

  FutureEither<EncryptionResponseModel> decryption({required EncryptionRequestModel request}) async {
    try {
      final response = await apiClient.postApi(
          endPoint: ApiUrls.rsaDecryptKey, body: request);
      return right(EncryptionResponseModel.fromJson(response));
    } catch (e, stackTrace) {
      AppUtility.log("response error ${e.toString()}");
      return left(
        Failure(e.toString()),
      );
    }
  }
}
