import 'package:dio/dio.dart';
import 'package:flutter_app/src/http/http_response.dart';
import 'package:flutter_app/src/http/http_transformer.dart';

/// 默认的HTTP转换器
class DefaultHttpTransformer extends HttpTransformer {
  /// todo 这里先注释掉
  /// 服务端异常与dart封装异常不匹配
  /// 后续以服务端异常为准
  /// 移动端只保留一些基础异常
  @override
  HttpResponse parse(Response response) {
    // if (response.data["code"] == 1 && response.data["msg"] == "成功") {
    if (response.data["code"] == "00000" && response.data["msg"] == "OK") {
      return HttpResponse.success(response.data["data"]);
    } else {
      return HttpResponse.failure(
        // errorMsg: response.data["message"], errorCode: response.data["code"]);
        errorMsg: response.data["message"],
        errorCode: -1,
      );
    }
  }

  /// 单例对象
  static DefaultHttpTransformer _instance = DefaultHttpTransformer._internal();

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  DefaultHttpTransformer._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory DefaultHttpTransformer.getInstance() => _instance;
}
