import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../model/news.dart';

/// Reference https://www.youtube.com/watch?v=zFXK5EsrUF0
class ApiService {
  /*Future<String> getTestApiData() async {
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
  }*/

  Future<List<Set<NewsArticle>>> getNewsArticles(String country) async {
    List<Set<NewsArticle>> listNewsArticles = [];
    final apiResponse = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=${country}&apiKey=$apiKey"));
    Map? responseData;
    if (apiResponse.statusCode == 200) {
      responseData = json.decode(apiResponse.body);
      var articles = responseData![keyArticles] as List<dynamic>;
      final transformed = articles
          .map((e) => {
                NewsArticle(
                    author: e[keyAuthor],
                    title: e[keyTitle],
                    url: e[keyUrl],
                    urlToImage: e[keyUrlToImage],
                    publishedAt: e[keyPublishedAt]),
              })
          .toList();
      listNewsArticles = transformed;
    } else {
      debugPrint("API FAILED: Failed to load the News Articles API");
    }
    return listNewsArticles;
  }

// testFun() {}

/*Future<List<String>> getTestdata() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(20, (i) => "news $i");
  }*/
}
