import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:shorts_tutorial/print.dart';
import 'package:shorts_tutorial/core/connectivity_helper.dart';
import 'package:shorts_tutorial/core/crud/request_state.dart';

enum MethodType { post, get, delete, put, patch }

final class Crud {
  final _headers = {
    // "Content-Type": "application/json",
    'Accept': 'application/json',
  };

  static late Dio _dio;
  static final _connectivityHelper = ConnectivityHelper();

  Crud() {
    _dio = Dio(
      BaseOptions(headers: _headers),
    );
  }

  Future<Either<RequestState, Map<String, dynamic>>> sendRequest({
    required String url,
    required MethodType methodType,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? token,
    File? file,
    String nameKeyFile = "file",
  }) async {
    /// check connection
    if (!await _connectivityHelper.isConnect) {
      return Left(OfflineState());
    }

    /// add headers
    if (token != null) {
      _dio.options.headers.addAll({
        'Authorization': 'Bearer $token',
        Headers.contentTypeHeader: Headers.formUrlEncodedContentType,
      });
    }

    /// add data
    final formData = FormData.fromMap(data ?? {});

    /// add file
    if (file != null) {
      final fileName = file.path.split('/').last;
      final fileUpload = await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      );
      formData.files.addAll({
        nameKeyFile: fileUpload,
      }.entries);
    }

    /// send request
    try {
      printme.blue(url);
      printme.blue(formData.fields);
      final response = await _dio.request(
        url,
        data: file == null ? data : formData,
        queryParameters: queryParameters,
        options: Options(method: methodType.name),
      );
      printme.cyan(response.statusCode);
      printme.printFullText(response.data);
      if (response.statusCode == 204) {
        throw NoContentException();
      }
      return Right(response.data);
    } on DioException catch (e) {
      printme.red('Response code: ${e.response?.statusCode}');
      printme.red('Response data: ${e.response?.data}');
      printme.red('Error: $e');
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return Left(TimeoutState());
        case DioExceptionType.sendTimeout:
          return Left(TimeoutState());
        case DioExceptionType.receiveTimeout:
          return Left(TimeoutState());
        case DioExceptionType.badCertificate:
          return Left(FailureState(message: 'badCertificate'));
        case DioExceptionType.badResponse:
          return Left(_handleDependOnCode(e));
        case DioExceptionType.cancel:
          return Left(FailureState(message: 'cancel'));
        case DioExceptionType.connectionError:
          return Left(FailureState(message: 'connectionError'));
        case DioExceptionType.unknown:
          return Left(FailureState(message: 'unknown'));
      }
    } catch (e) {
      printme.red(e);
      return Left(FailureState(message: e.toString()));
    }
  }

  RequestState _handleDependOnCode(DioException e) {
    if (e.response?.statusCode == 204) {
      return NoContentState();
    }
    if (e.response?.statusCode == 401) {
      return UnauthorizedState();
    }
    if (e.response?.statusCode == 404) {
      return NotFoundState();
    }
    return FailureState();
  }
}

class NoContentException extends DioException {
  NoContentException()
      : super(
          requestOptions: RequestOptions(),
          message: 'No Content',
          type: DioExceptionType.badResponse,
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: 204,
          ),
        );
}
