import 'package:http/http.dart' as http;

/// Reference https://www.youtube.com/watch?v=zFXK5EsrUF0

Future<List<String>> getApiData() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&apiKey=af3ce09176fb4fd3be6fcfd1e000776c'));
  if (response.statusCode == 200) {
    final responseBody = response.body;
    print("RESPONSE: {$responseBody}");
  } else {
    print("API FAILED");
  }

  return List.generate(20, (i) => "test $i");
}

Future<List<String>> getTestdata() async {
  await Future.delayed(const Duration(seconds: 2));
  return List.generate(20, (i) => "news $i");
}
