import 'dio_http/http_util.dart';
import 'dio_http/response_data.dart';

class DefaultService {

  //获取设备token
  static Future<Resource> getGuestId(Map<String,dynamic> param){
    return HttpUtil.post('guest/getId',queryParameters: param);
  }
}