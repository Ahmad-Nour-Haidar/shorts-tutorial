import 'package:dio/dio.dart';

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