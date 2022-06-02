import 'package:app/compenents/side_box.dart';
import 'package:app/data/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/article_list_view_screen.dart';
import '../screens/course_list_view_screen.dart';

class SideBoxesColumn extends StatelessWidget {
  const SideBoxesColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    return Column(children: [
      SideBox(
        onTap: () {
          uiProvider.toggleSideBar();
        },
        boxColor: const Color(0xFF4200CF),
        icon: Icons.home,
        iconColor: Colors.white,
        title: "Home",
        titleColor: Colors.white,
      ),
      SideBox(
        onTap: (() => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ArticleListView()))),
        icon: Icons.article,
        title: "Article",
      ),
      SideBox(
        onTap: (() => Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseListView()))),
        icon: Icons.monitor,
        title: "Courses",
      ),
      const SideBox(
        icon: Icons.event,
        title: "Events",
      ),
      const SideBox(
        icon: Icons.login,
        title: "Login",
      ),
      const SideBox(
        icon: Icons.info,
        title: "About us",
      )
    ]);
  }
}
