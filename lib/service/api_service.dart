import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../model/news.dart';

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

  Future<List<Set<NewsArticle>>> getNews() async {
    List<Set<NewsArticle>> listNewsArticles = [];
    final response = await http.get(Uri.parse(apiHeadlines));
    Map? data;
    var newsData = "";
    if (response.statusCode == 200) {
      final responseBody = response.body;
      data = json.decode(response.body);
      // print("RESPONSE: $responseBody");
      // print("RESPONSE DATA: $data");
      var articles = data!["articles"] as List<dynamic>;
      final transformed = articles
          .map((e) => {
                NewsArticle(
                    author: e['author'],
                    title: e['title'],
                    url: e['url'],
                    urlToImage: e['urlToImage'],
                    publishedAt: e['publishedAt']),
              })
          .toList();
      listNewsArticles = transformed;
      newsData = "Got response";
    } else {
      newsData = "Api Failed";
      print("API FAILED");
    }
    return listNewsArticles;
  }

  testFun() {}

/*Future<List<String>> getTestdata() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(20, (i) => "news $i");
  }*/
}
