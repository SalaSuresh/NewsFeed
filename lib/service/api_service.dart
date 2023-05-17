import 'package:http/http.dart' as http;

import '../constants/constants.dart';

/// Reference https://www.youtube.com/watch?v=zFXK5EsrUF0
Future<String> getTestApiData() async {
  final response = await http.get(Uri.parse(apiTest));
  if (response.statusCode == 200) {
    final responseBody = response.body;
    print("RESPONSE: {$responseBody}");
  } else {
    print("API FAILED");
  }
  return "Response Message";
}

Future<List<String>> getTestdata() async {
  await Future.delayed(const Duration(seconds: 2));
  return List.generate(20, (i) => "news $i");
}
