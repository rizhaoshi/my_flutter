class TokenModel {
  final String deviceToken;
  final int guestId;
  final String province;
  final String provinceCode;

  TokenModel({
    required this.deviceToken,
    required this.guestId,
    required this.province,
    required this.provinceCode,
  });

  factory TokenModel.fromJson(dynamic item) {
    return TokenModel(
      guestId: item['guestId'],
      deviceToken: item['deviceToken'],
      province: item['province'],
      provinceCode: item['provinceCode'],
    );
  }
}
