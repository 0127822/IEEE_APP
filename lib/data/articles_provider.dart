import 'package:app/data/articles_api.dart';
import 'package:flutter/material.dart';

import 'article.dart';

enum ListScreenState { initial, loading, success, error }
enum DetailsScreenState { initial, loading, success, error }

class ArticlesProvider with ChangeNotifier {
  ListScreenState state = ListScreenState.initial;
  DetailsScreenState detailsState = DetailsScreenState.initial;

  late APIResult result;
  List<Article> articlesList = [];

  String? errorMessage;

  Article? articleDetails;
  void getAllArticles() async {
    result = await ArticlesApi().getAllArticles();
    if (result.faliure?.code != null) {
      errorMessage = result.faliure?.message;
      state = ListScreenState.error;
      notifyListeners();
    } else {
      articlesList = result.data;
      state = ListScreenState.success;
      notifyListeners();
    }
  }

  void findArticleById(int id) async {
    result = await ArticlesApi().getArticleById(id);
    if (result.faliure?.code != null) {
      errorMessage = result.faliure?.message;
      detailsState = DetailsScreenState.error;
      notifyListeners();
    } else {
      articleDetails = result.data;
      detailsState = DetailsScreenState.success;
      notifyListeners();
    }
  }
}
