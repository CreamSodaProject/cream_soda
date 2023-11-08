import 'dart:convert';

import 'package:cream_soda/constants/http_setting/use_http.dart';
import 'package:http/http.dart';

class CalendarRepository {
  var baseUrl = UseHttp.baseUrl;
  var headers = UseHttp.getJsonTypeAcceptHeader();
  var basePort = UseHttp.basePort;
  final scheme = 'http';

  Future<Response> saveCalendar({required String name, required String imageFile}) async{
    String encodedUrl = Uri(
      scheme: scheme,
      host: baseUrl,
      port: basePort,
      path: 'calendar', // 경로
    ).toString();

    return await post(Uri.parse(encodedUrl),
        headers: headers,
        body: jsonEncode({'name': name, 'image': imageFile}));
  }
}