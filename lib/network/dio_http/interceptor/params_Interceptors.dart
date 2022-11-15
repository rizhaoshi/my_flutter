import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:my_flutter_a/network/dio_http/config/http_config.dart';

class ParamsInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String afferentParams = "";
    final data = options.data;
    if (data != null) {
      if (data is Map) {
        afferentParams += json.encode(data);
      } else if (data is FormData) {
        final formDataMap = {}
          ..addEntries(data.fields)
          ..addEntries(data.files);
        afferentParams += json.encode(formDataMap);
      } else {
        afferentParams += json.encode(data);
      }

      String sign = getSignEncryption(afferentParams);
      options.path += "?sign=$sign";
      print("=====requestStr=====$afferentParams");
      return handler.next(options);
    }
  }

  String getSignEncryption(String str) {
    var content = const Utf8Encoder().convert(str + HttpConfig.SIGN_PASSWORD);

    return md5.convert(content).toString();
  }

  // 你也可以在响应或错误时执行一些动作
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}
