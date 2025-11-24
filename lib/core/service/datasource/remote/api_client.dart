import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:my_trainer/core/service/datasource/local/local_service.dart';
import 'package:my_trainer/utils/multipart/multipart_body.dart';
import 'network_checker.dart';

class ApiClient {
  final Dio dio;
  final NetworkChecker networkChecker;
  final LocalService localService;

  ApiClient({
    required this.dio,
    required this.networkChecker,
    required this.localService,
  });

  Future<Map<String, String>> _headers({String? token, bool isJson = true}) async {
    final headers = <String, String>{};
    final authToken = token ?? await localService.getToken();

    if (authToken.isNotEmpty) headers['Authorization'] = authToken;
    if (isJson) headers['Content-Type'] = 'application/json';

    return headers;
  }

  Future<bool> _hasConnection() async => await networkChecker.hasConnection();

  Future<Response> get({required String url, Map<String, dynamic>? queryParams, String? token}) async {
    if (!await _hasConnection()) {
      return _buildErrorResponse('No internet connection');
    }

    try {
      final headers = await _headers(token: token);
      final response = await dio.get(url, queryParameters: queryParams, options: Options(headers: headers));
      return response;
    } catch (e) {
      return _handleDioError(e);
    }
  }

  Future<Response> post({required String url, required Map<String, dynamic> body, String? token}) async {
    if (!await _hasConnection()) {
      return _buildErrorResponse('No internet connection');
    }

    try {
      final headers = await _headers(token: token);
      final response = await dio.post(url, data: body, options: Options(headers: headers));
      return response;
    } catch (e) {
      return _handleDioError(e);
    }
  }

  Future<Response> put({required String url, Map<String, dynamic>? body, String? token}) async {
    if (!await _hasConnection()) return _buildErrorResponse('No internet connection');

    try {
      final headers = await _headers(token: token);
      final response = await dio.put(url, data: body, options: Options(headers: headers));
      return response;
    } catch (e) {
      return _handleDioError(e);
    }
  }

  Future<Response> patch({required String url, Map<String, dynamic>? body, String? token}) async {
    if (!await _hasConnection()) return _buildErrorResponse('No internet connection');

    try {
      final headers = await _headers(token: token);
      final response = await dio.patch(url, data: body, options: Options(headers: headers));
      return response;
    } catch (e) {
      return _handleDioError(e);
    }
  }

  Future<Response> delete({required String url, Map<String, dynamic>? body, String? token}) async {
    if (!await _hasConnection()) return _buildErrorResponse('No internet connection');

    try {
      final headers = await _headers(token: token, isJson: false);
      final response = await dio.delete(url, data: body, options: Options(headers: headers));
      return response;
    } catch (e) {
      return _handleDioError(e);
    }
  }

  Future<Response> uploadMultipart({
    required String url,
    required List<MultipartBody> files,
    required String method,
    required String token,
    Map<String, String>? fields,
  }) async {
    if (!await _hasConnection()) return _buildErrorResponse('No internet connection');

    try {
      final headers = await _headers(token: token, isJson: false);
      final formMap = <String, dynamic>{};
      fields?.forEach((k, v) => formMap[k] = v);

      for (final file in files) {
        final mimeType = lookupMimeType(file.file.path) ?? 'application/octet-stream';
        final split = mimeType.split('/');
        formMap[file.fieldKey] = await MultipartFile.fromFile(
          file.file.path,
          filename: file.file.uri.pathSegments.last,
          contentType: MediaType(split[0], split[1]),
        );
      }

      final formData = FormData.fromMap(formMap);
      final response = await dio.request(url, data: formData, options: Options(method: method, headers: headers));
      return response;
    } catch (e) {
      return _handleDioError(e);
    }
  }

  Response _buildErrorResponse(String message, {int statusCode = 500}) {
    return Response(
      requestOptions: RequestOptions(path: ''),
      statusCode: statusCode,
      data: {'success': false, 'message': message},
    );
  }

  Response _handleDioError(dynamic error) {
    if (error is Response) return error;

    if (error is DioException) {
      final requestOptions = error.requestOptions;
      final statusCode = error.response?.statusCode ?? 500;
      final data = error.response?.data ?? {};

      /*if (statusCode == 401) {
        try {
          sl<LocalService>().logOut();
          AppRouter.route.goNamed(RoutePath.loginScreen);
        } catch (_) {}
        return Response(requestOptions: requestOptions, statusCode: 401, data: {'success': false, 'message': 'Session expired. Please login again.'});
      }*/

      if ({DioExceptionType.connectionTimeout, DioExceptionType.sendTimeout, DioExceptionType.receiveTimeout}.contains(error.type)) {
        return Response(requestOptions: requestOptions, statusCode: 408, data: {'success': false, 'message': 'Connection timeout. Please try again later.'});
      }

      if (error.type == DioExceptionType.unknown && error.error is SocketException) {
        return Response(requestOptions: requestOptions, statusCode: 0, data: {'success': false, 'message': 'No internet connection.'});
      }

      if (error.type == DioExceptionType.badResponse) {
        return Response(requestOptions: requestOptions, statusCode: statusCode, data: {'success': false, 'message': data['message'] ?? 'Unexpected server response.', 'data': data});
      }

      if (error.type == DioExceptionType.cancel) {
        return Response(requestOptions: requestOptions, statusCode: 499, data: {'success': false, 'message': 'Request was cancelled.'});
      }

      return Response(requestOptions: requestOptions, statusCode: statusCode == 0 ? 500 : statusCode, data: {'success': false, 'message': error.message ?? 'Unexpected Dio error.'});
    }

    if (error is SocketException) {
      return Response(requestOptions: RequestOptions(path: ''), statusCode: 0, data: {'success': false, 'message': 'No internet connection.'});
    }

    return Response(requestOptions: RequestOptions(path: ''), statusCode: 500, data: {'success': false, 'message': 'An unexpected error occurred.', 'details': error.toString()});
  }
}
