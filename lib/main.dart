import 'package:app/data/ui_provider.dart';
import 'package:app/screens/articles_details.dart';
import 'package:app/screens/course_details.dart';
import 'package:app/screens/course_list_view_screen.dart';
import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/articles_provider.dart';
import 'data/courses_provider.dart';

void main() {
  runApp(const MyApp());
 
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ArticlesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CoursesProvider(),
        ),
      ],
      child: MaterialApp(
        routes: {
          ArticleDetails.routeName: (context) => const ArticleDetails(),
          CourseListView.routeName: (context) => CourseListView(),
          CourseDetailsScreen.routeName: (context) => CourseDetailsScreen(),
        },
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          backgroundColor: Colors.black,
          body: MyHomePage(),
        ),
      ),
    );
  }
}
