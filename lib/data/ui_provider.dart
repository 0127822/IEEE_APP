import 'package:flutter/material.dart';

class UiProvider with ChangeNotifier {
  bool _isClicked = false;
  bool get isClicked {
    return _isClicked;
  }

  void toggleSideBar() {
    _isClicked = !_isClicked;
    notifyListeners();
  }
}
