import "dart:async";
import "dart:convert";
import "dart:io";
import "package:connectivity_plus/connectivity_plus.dart";
import "package:dio/dio.dart";
import "package:dio/io.dart";
import "package:flutter/foundation.dart";
import "package:flutter/services.dart";
import "package:l/l.dart";
import "../../storage/app_storage.dart";
import "../interceptors/connectivity_interceptor.dart";
import "api_connection.dart";
import "api_constants.dart";

@immutable
class ApiService {
  const ApiService._();

  static Future<Dio> initDio({required String baseUrl}) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: await ApiService.getHeaders(),
        connectTimeout: ApiConst.connectionTimeout,
        receiveTimeout: ApiConst.sendTimeout,
        sendTimeout: ApiConst.sendTimeout,
        validateStatus: (status) => status != null && status < 205,
      ),
    );

    dio.interceptors.addAll(
      [
        ConnectivityInterceptor(
          requestReceiver: Connection(
            dio: dio,
            connectivity: Connectivity(),
          ),
        ),
      ],
    );

    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    return dio;
  }

  static Future<Map<String, String>> getHeaders({bool isUpload = false}) async {
    final headers = <String, String>{
      "Content-type": isUpload ? "multipart/form-data" : "application/json; charset=UTF-8",
      "Accept": isUpload ? "multipart/form-data" : "application/json; charset=UTF-8",
    };

    final token = await AppStorage.$read(key: StorageKey.accessToken) ?? "";

    if (token.isNotEmpty) {
      headers.putIfAbsent("Authorization", () => "Bearer $token");
    }

    return headers;
  }

  static Future<String?> get({required String api, required String baseUrl, required Map<String, dynamic> params}) async {
    try {
      final response = await (await initDio(baseUrl: baseUrl)).get<dynamic>(api, queryParameters: params);
      return jsonEncode(response.data);
    } on TimeoutException catch (_) {
      l.e("The connection has timed out, Please try again!");
      rethrow;
    } on DioException catch (e) {
      l.e(e.response.toString());
      rethrow;
    } on Object catch (e) {
      l.e(e.toString());
      rethrow;
    }
  }

  static Future<String?> post(
      {required String api,
      required String baseUrl,
      required Map<String, dynamic> data,
      Map<String, dynamic> params = const <String, dynamic>{}}) async {
    try {
      final response = await (await initDio(baseUrl: baseUrl)).post<dynamic>(api, data: data, queryParameters: params);
      return jsonEncode(response.data);
    } on TimeoutException catch (_) {
      l.e("The connection has timed out, Please try again!");
      rethrow;
    } on DioException catch (e) {
      l.e(e.response.toString());
      rethrow;
    } on Object catch (_) {
      rethrow;
    }
  }

  static Future<String?> multipart(
    String api,
    List<File> paths, {
    bool picked = false,
  }) async {
    final formData = paths.mappedFormData(isPickedFile: picked);

    try {
      final response = await Dio(
        BaseOptions(
          baseUrl: ApiConst.baseUrl,
          validateStatus: (status) => status! < 203,
          headers: await getHeaders(isUpload: true),
        ),
      ).post<String?>(
        api,
        data: formData,
        onSendProgress: (int sentBytes, int totalBytes) {
          final progressPercent = sentBytes / totalBytes * 100;
          l.i("Progress: $progressPercent %");
        },
        onReceiveProgress: (int sentBytes, int totalBytes) {
          final progressPercent = sentBytes / totalBytes * 100;
          l.i("Progress: $progressPercent %");
        },
      ).timeout(
        const Duration(minutes: 10),
        onTimeout: () {
          throw TimeoutException(
            "The connection has timed out, Please try again!",
          );
        },
      );

      return jsonEncode(response.data);
    } on DioException catch (e) {
      l.e(e.response.toString());
      rethrow;
    } on Object catch (_) {
      rethrow;
    }
  }

  static Future<String?> put({required String api, required String baseUrl, required Map<String, dynamic> data}) async {
    try {
      final response = await (await initDio(baseUrl: baseUrl)).put<dynamic>(api, data: data);

      return jsonEncode(response.data);
    } on TimeoutException catch (_) {
      l.e("The connection has timed out, Please try again!");
      rethrow;
    } on DioException catch (e) {
      l.e(e.response.toString());
      rethrow;
    } on Object catch (_) {
      rethrow;
    }
  }

  static Future<String?> putAccount({required String api,required String baseUrl,  required Map<String, dynamic> params}) async {
    try {
      final response = await (await initDio(baseUrl: baseUrl)).put<dynamic>(api, queryParameters: params);

      return jsonEncode(response.data);
    } on TimeoutException catch (_) {
      l.e("The connection has timed out, Please try again!");
      rethrow;
    } on DioException catch (e) {
      l.e(e.response.toString());
      rethrow;
    } on Object catch (_) {
      rethrow;
    }
  }

  static Future<String?> delete({required String api, required String id,required String baseUrl, required Map<String, dynamic> params}) async {
    try {
      final _ = await (await initDio(baseUrl: baseUrl)).delete<dynamic>("$api/$id", queryParameters: params);
      return "success";
    } on TimeoutException catch (_) {
      l.e("The connection has timed out, Please try again!");
      rethrow;
    } on DioException catch (e) {
      l.e(e.response.toString());
      rethrow;
    } on Object catch (_) {
      rethrow;
    }
  }
}

extension ListFileToFormData on List<File> {
  Future<FormData> mappedFormData({required bool isPickedFile}) async => FormData.fromMap(
        <String, MultipartFile>{
          for (final v in this) ...{
            DateTime.now().toString(): MultipartFile.fromBytes(
              isPickedFile ? v.readAsBytesSync() : (await rootBundle.load(v.path)).buffer.asUint8List(),
              filename: v.path.substring(v.path.lastIndexOf("/")),
            ),
          },
        },
      );
}
