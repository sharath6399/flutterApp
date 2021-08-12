import 'dart:convert';

import 'package:flutterNews/model/article_model.dart';
import 'package:http/http.dart';



class ApiService {
  
  final endPointUrl =
      "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey={https://api.sampleapis.com/futurama/characters}";

  

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];


      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}