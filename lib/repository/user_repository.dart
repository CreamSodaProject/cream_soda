import 'dart:convert';

import 'package:cream_soda/constants/http_setting/use_http.dart';
import 'package:http/http.dart';

class UserRepository {
  var baseUrl = UseHttp.baseUrl;
  var headers = UseHttp.getJsonTypeHeader();
  var basePort = UseHttp.basePort;
  final scheme = 'http';

  Future<Response> sendEmail({required String email}) async{
    String encodedUrl = Uri(
      scheme: scheme,
      host: baseUrl,
      port: basePort,
      path: '/???', // 경로
    ).toString();

    return await post(Uri.parse(encodedUrl),
        headers: headers,
        body: jsonEncode({'email': email}));
  }

  Future<Response> join(
      {required String email, required String password}) async {
    String encodedUrl = Uri(
      scheme: scheme,
      host: baseUrl,
      port: basePort,
      path: '/user/join', // 경로
    ).toString();
    return await post(Uri.parse(encodedUrl),
        headers: headers,
        body: jsonEncode({'email': email, 'password': password}));
  }
}
