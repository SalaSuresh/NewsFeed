import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/constants.dart';

/// Reference https://www.youtube.com/watch?v=zFXK5EsrUF0
class ApiService {
  Future<String> getTestApiData() async {
    final response = await http.get(Uri.parse(apiTest));
    Map? data;
    if (response.statusCode == 200) {
      final responseBody = response.body;
      data = json.decode(response.body);
      print("RESPONSE: $responseBody");
      print("RESPONSE: ${data!["testKey"]}");
    } else {
      print("API FAILED");
    }
    return data!["testKey"];
  }

/*Future<List<String>> getTestdata() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(20, (i) => "news $i");
  }*/
}
