import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({Key? key, this.category}) : super(key: key);
  final String? category;

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Text(
      "$category",
      style: const TextStyle(color: Color(0xFFBA0C2F), fontSize: 18.0),
    ));
  }
}
