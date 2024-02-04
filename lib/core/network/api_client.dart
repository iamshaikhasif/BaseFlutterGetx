import 'dart:convert';
import 'dart:io';

import 'package:base_project_getx/app/data/models/request/refresh_token_request_model.dart';
import 'package:base_project_getx/app/data/models/response/refresh_token_response_model.dart';
import 'package:base_project_getx/app/data/enum/storage_key_enum.dart';
import 'package:base_project_getx/core/helper/screen_info.dart';
import 'package:base_project_getx/core/helper/storage_service.dart';
import 'package:base_project_getx/core/helper/utilies.dart';
import 'package:base_project_getx/core/network/api_urls.dart';
import 'package:base_project_getx/core/network/logger_interceptors.dart';
import 'package:dio/dio.dart';

class ApiClient {

  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiUrls.baseUrl,
        connectTimeout: const Duration(minutes: 3),
        receiveTimeout: const Duration(minutes: 3),
      ),
    );

    getOption();
  }


  Future<void> getOption() async {
    _dio.interceptors.add(
      AppInterceptor()
    );
  }

  Future getApi({endPoint}) async {
    try {
      Response response = await _dio.get(endPoint);
      return response.data;
    } on DioException catch (ex) {
      var statusCode = ex.response?.statusCode ?? 0;

    }
  }

  Future postApi(
      {endPoint, body, bool isMultipart = false, bool isHeader = true}) async {
    try {
      Response response = await _dio.post(endPoint,
          data: isMultipart ? body : jsonEncode(body));
      return response.data;
    } on DioException catch (ex) {
      var statusCode = ex.response?.statusCode ?? 0;
      AppUtility.log("Error Response ---> $statusCode - $endPoint \n ${ex.message}");
    }
  }

  Future<String> getRefreshToken() async {
    String refreshTokenStatus = "";
    var request = RefreshTokenRequestModel(
      appVersion: ScreenInfo.appVersion,
      deviceModel: ScreenInfo.mobileModel,
      osVersion: ScreenInfo.mobileVersion,
    );
    var res = await postApi(endPoint: ApiUrls.refreshTokenKey, body: request);
    var refreshToken = RefreshTokenResponseModel.fromJson(res);
    if (refreshToken.success ?? false) {
      refreshTokenStatus = refreshToken.data?.authToken ?? "";
      await StorageService.write(StorageKey.authToken.name, refreshTokenStatus);
    }

    return refreshTokenStatus;
  }
}
