import 'package:flutter/material.dart';

class SideBox extends StatelessWidget {
  const SideBox(
      {Key? key,
      this.icon,
      this.iconColor,
      this.boxColor,
      this.title,
      this.titleColor,
      this.onTap})
      : super(key: key);
  final IconData? icon;
  final Color? iconColor;
  final Color? boxColor;
  final String? title;
  final Color? titleColor;
  final VoidCallback? onTap;
  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          height: 50.0,
          margin: const EdgeInsets.only(bottom: 30.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            color: boxColor ?? const Color(0xFFE2D8D8),
          ),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                icon,
                size: 30,
                color: iconColor ?? const Color(0xFF868686),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "$title",
                  maxLines: 1,
                  style: TextStyle(
                      color:
                          titleColor ?? const Color.fromARGB(255, 77, 77, 77),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            )
          ])),
    );
  }
}
