import 'dart:convert' as convert;
import 'dart:io';

import 'package:app/constants.dart';
import 'package:app/data/article.dart';
import 'package:http/http.dart' as http;

class Faliure {
  int code;
  String message;
  Faliure({
    required this.code,
    required this.message,
  });
}

class APIResult {
  dynamic data;
  Faliure? faliure;
  APIResult({
    this.data,
    this.faliure,
  });
}

class ArticlesApi {
  late ArticlesResponse articlesResponse;
  APIResult apiResult = APIResult();

  Future<APIResult> getAllArticles() async {
    try {
      var url = Uri.https(
          'ieeeswalexsc.herokuapp.com', '/api/articles', {'q': '{http}'});

      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        articlesResponse = ArticlesResponse.fromJson(jsonResponse);
        apiResult.data = articlesResponse.articles;
      } else {
        apiResult.faliure =
            Faliure(code: response.statusCode, message: "Error in server");
      }
    } on SocketException {
      Faliure(code: sokectCode, message: "Check your internet connection");
    } on FormatException {
      Faliure(code: formatCode, message: "Problem in retrieving data");
    } catch (exception) {
      Faliure(code: generalCode, message: "ERROR");
    }
    return apiResult;
  }

  Future<APIResult> getArticleById(int articleID) async {
    var r;
    Article article; 
    try {
      var url = Uri.https('ieeeswalexsc.herokuapp.com',
          '/api/articles/$articleID', {'q': '{http}'});
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        r = jsonResponse["data"];
        article = Article.fromJson(r);

        apiResult.data = article;
      } else {
        apiResult.faliure =
            Faliure(code: response.statusCode, message: "Error in server");
      }
    } on SocketException {
      Faliure(code: sokectCode, message: "Check your internet connection");
    } on FormatException {
      Faliure(code: formatCode, message: "Problem in retrieving data");
    } catch (exception) {
      Faliure(code: generalCode, message: "ERROR");
    }
    return apiResult;
  }
}
