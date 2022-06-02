import 'package:app/compenents/list_view.dart';
import 'package:app/data/article.dart';
import 'package:app/data/articles_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../compenents/tab.dart';
import 'articles_details.dart';

// ignore: must_be_immutable
class ArticleListView extends StatefulWidget {
  const ArticleListView({Key? key}) : super(key: key);

  @override
  State<ArticleListView> createState() => _ArticleListViewState();
}

class _ArticleListViewState extends State<ArticleListView> {
  late List<Article> articleList;
  late ArticlesProvider articlesProvider;
  TabBar get _tabBar => const TabBar(
        indicatorColor: Color(0xFFBA0C2F),
        tabs: [
          CategoryTab(category: "Category 1"),
          CategoryTab(category: "Category 2"),
          CategoryTab(category: "Category 3"),
        ],
      );
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    articlesProvider = Provider.of<ArticlesProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    if (articlesProvider.state == ListScreenState.initial) {
      articlesProvider.getAllArticles();
      return const Center(child: CircularProgressIndicator());
    } else if (articlesProvider.state == ListScreenState.error) {
      Fluttertoast.showToast(
          msg: articlesProvider.errorMessage!,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      articleList = articlesProvider.articlesList;
    }
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            bottom: _tabBar,
            backgroundColor: Colors.black,
            centerTitle: false,
            title: const Text(
              "Articles",
              style: TextStyle(
                  fontSize: 28,
                  color: Color(0xFFBA0C2F),
                  fontWeight: FontWeight.bold),
            )),
        body: TabBarView(children: [
          IeeeListView(
            items: articleList,
            route: ArticleDetails.routeName,
          ),
          IeeeListView(
            items: articleList,
            route: ArticleDetails.routeName,
          ),
          IeeeListView(
            items: articleList,
            route: ArticleDetails.routeName,
          ),
        ]),
      ),
    );
  }
}
