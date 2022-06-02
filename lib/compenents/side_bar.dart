import 'package:app/compenents/side_boxes.dart';
import 'package:app/data/ui_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool uiProvider = Provider.of<UiProvider>(context).isClicked;

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: uiProvider ? width / 2.3 : 65,
      height: height,
      child: Container(
        height: height,
        padding: EdgeInsets.only(
          top: height / 7,
          left: 10,
          right: 10,
        ),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            color: Color(0xFF880000)),
        child: const SideBoxesColumn(),
      ),
    );
  }
}
