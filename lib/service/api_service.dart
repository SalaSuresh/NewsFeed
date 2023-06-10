import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../model/news.dart';

/// Reference https://www.youtube.com/watch?v=zFXK5EsrUF0
class ApiService {
  Future<String> getUserCountry() async {
    String countryCode = "";
    final apiResponse = await http.get(Uri.parse(apiUserCountryCode));
    Map? responseData;
    if (apiResponse.statusCode == 200) {
      responseData = json.decode(apiResponse.body);
      countryCode = responseData!["countryCode"];
    }
    return countryCode;
  }

  Future<List<Set<NewsArticle>>> getNewsArticles() async {
    String country = await getUserCountry();
    List<Set<NewsArticle>> listNewsArticles = [];
    final apiResponse =
        await http.get(Uri.parse(apiHeadlines.replaceAll("%s", country)));
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

/*Future<List<String>> getTestdata() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(20, (i) => "news $i");
  }*/
}
