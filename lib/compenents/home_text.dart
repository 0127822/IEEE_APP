import 'package:flutter/material.dart';

class HomeText extends StatelessWidget {
  const HomeText({Key? key, this.title, this.size, this.color, this.weight})
      : super(key: key);
  final String? title;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      style: TextStyle(
        fontSize: size ?? 60,
        fontWeight: weight ?? FontWeight.bold,
        color: color ?? Colors.white,
      ),
    );
  }
}
