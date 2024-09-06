import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/api_interceptors.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:dio/dio.dart';

import '../../error/error_model.dart';
import '../../error/exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer(this.dio) {
    dio.options
      ..baseUrl = EndPointsAPI.baseUrl
      ..headers = {};
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      error: true,
    ));
  }
  //! delete method
  @override
  Future delete(
    String path, {
    Map<String, dynamic>? body,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//! get method
  @override
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    // implement get
    try {
      var res = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//! patch method
  @override
  Future patch(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    try {
      var res = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//! post method
  @override
  Future post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    try {
      var res = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//! put method
  @override
  Future put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    return await dio.put(path, data: body, queryParameters: queryParameters);
  }

//! handleDioException
  handleDioException(e) {
    switch (e.type) {
      case DioExceptionType.badCertificate:
        throw BadCertificateException(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.connectionTimeout:
        throw ConnectionTimeoutException(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.sendTimeout:
        throw ServerException(ErrorModel.fromJson(e.response!.data));

      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 400: //bad request
            throw BadRequestException(ErrorModel.fromJson(e.response!.data));

          case 401: //unauthorized
            throw UnauthorizedException(ErrorModel.fromJson(e.response!.data));

          case 403: //forbidden
            throw ForbiddenException(ErrorModel.fromJson(e.response!.data));

          case 404: //notFound
            throw NotFoundException(ErrorModel.fromJson(e.response!.data));

          case 409: //conflict
            throw ConflictException(ErrorModel.fromJson(e.response!.data));

          // print(e.response);
        }
      case DioExceptionType.cancel:
        throw CancleExeption(ErrorModel.fromJson(e.response!.data));

      case DioExceptionType.unknown:
        throw ServerException(ErrorModel.fromJson(e.response!.data));

      // throw ServerException('badResponse');
    }
  }
}
