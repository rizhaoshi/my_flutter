class UrlConfig {
  /*
   * 是否调试模式
   */
  static const bool IS_DEBUG = true;

  /*
    * 服务器地址(测试)
    */
  static const String SERVER_HOST_DEBUG = "http://gwtest.qiuxuebao.com/";

  /*
    * 服务器地址(正式)
    */
  static const String SERVER_HOST_RELEASE = "https://gw.qiuxuebao.com";

  /*
    * 服务器地址
    */
  static const String SERVER_HOST = IS_DEBUG ? SERVER_HOST_DEBUG : SERVER_HOST_RELEASE;
}
