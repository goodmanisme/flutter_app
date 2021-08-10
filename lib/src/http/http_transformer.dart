import 'package:dio/dio.dart';
import 'package:flutter_app/src/http/http_response.dart';

/// Response 解析
abstract class HttpTransformer {
  HttpResponse parse(Response response);
}
