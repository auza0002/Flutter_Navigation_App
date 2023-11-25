import 'package:http/http.dart' as http;
// http.get http.ppost and so on.
import 'dart:convert';
// for JSOn convserion
import 'dart:async';

class HTTPClass {
  static Future<List<MainResult>> fetch(String url, String method) async {
    Uri uri = Uri.parse(url);

    switch (method) {
      case 'get':
        http.Response resp = await http.get(uri);
        if (resp.statusCode == 200) {
          List<dynamic> data = jsonDecode(resp.body) as List<dynamic>;
          return data.map((item) {
            return MainResult.fromJson(item);
          }).toList();
        } else {
          throw Exception("Did not get a valid response");
        }
      case 'post':
        throw Exception("Not a valid method");
      default:
        throw Exception("Not a valid method");
    }
  }
}

class MainResult {
  String q;
  String a;
  String c;
  String h;

  MainResult({
    required this.q,
    required this.a,
    required this.c,
    required this.h,
  });

  factory MainResult.fromJson(Map<String, dynamic> json) => MainResult(
        q: json["q"],
        a: json["a"],
        c: json["c"],
        h: json["h"],
      );
}
