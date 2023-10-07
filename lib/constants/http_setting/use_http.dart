class UseHttp {

  static const String _baseUrl = "tt";
  static const int basePort = 8080;
  static const String _contentType = "application/json; charset=utf-8";

  static String get baseUrl => _baseUrl;

  static Map<String, String> getJsonTypeHeader() {
    return {
      'Content-Type': _contentType
    };
  }

  static Map<String, String> getJsonTypeAcceptHeader() {
    return {
      'Content-Type': _contentType,
      'Accept': _contentType
    };
  }



}