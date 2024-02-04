import 'package:base_project_getx/app/data/enum/log_error_tag.dart';
import 'package:base_project_getx/app/data/enum/storage_key_enum.dart';
import 'package:base_project_getx/core/helper/dio_logs.dart';
import 'package:base_project_getx/core/helper/screen_info.dart';
import 'package:base_project_getx/core/helper/storage_service.dart';
import 'package:base_project_getx/core/helper/talker_dio_logger_settings.dart';
import 'package:base_project_getx/core/helper/utilies.dart';
import 'package:dio/dio.dart';

class AppInterceptor implements Interceptor {
  @override
  void onRequest(
      RequestOptions option, RequestInterceptorHandler handler) async {
    String token = await StorageService.read(StorageKey.authToken.name) ?? "";
    option.headers["Accept"] = "application/json";
    option.headers["Authorization"] = "Bearer $token";

    try {
      final message = '${option.uri}';
      final httpLog = DioRequestLog(
        message,
        requestOptions: option,
        settings: const TalkerDioLoggerSettings(),
      );
      ScreenInfo.talker.logTyped(httpLog);
    } catch (e) {
      AppUtility.log("Api onError $e", tag: LogErrorTag.error);
    }

    handler.next(option);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    try {
      final message = '${error.requestOptions.uri}';
      final httpErrorLog = DioErrorLog(
        message,
        dioException: error,
        settings: const TalkerDioLoggerSettings(),
      );
      ScreenInfo.talker.logTyped(httpErrorLog);
    } catch (e) {
      AppUtility.log("Api onError $e", tag: LogErrorTag.error);
    }
    return handler.next(error);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      final message = '${response.requestOptions.uri}';
      final httpLog = DioResponseLog(
        message,
        response: response,
        settings: const TalkerDioLoggerSettings(),
      );
      ScreenInfo.talker.logTyped(httpLog);
    } catch (e) {
      AppUtility.log("Api onResponse $e", tag: LogErrorTag.error);
    }

    return handler.next(response);
  }
}
