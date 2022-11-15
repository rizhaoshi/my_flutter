import 'package:my_flutter_a/network/token_model.dart';
// 每次添加新的Json类都要在这里调用.fromJson方法
class EntityFactory {
  static T? generateOBJ<T>(json) {
    if (T.toString() == "TokenModel") {
      return TokenModel.fromJson(json) as T;
    } else {
      return null;
    }
  }
}