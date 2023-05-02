import 'package:common_bottom_nav/bottom_navigation/bottom_screen.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation_item_model.dart';

class BottomViewModel extends ChangeNotifier {
  List<BottomNavigationModel> bottomItems = [
    BottomNavigationModel(
      title: "Home",
      routeName: BottomScreenView.route,
      iconData: Icons.home,
    ),
    BottomNavigationModel(
      title: "Search",
      routeName: BottomScreenView.route,
      iconData: Icons.search,
    ),
    BottomNavigationModel(
      title: "Notification",
      routeName: BottomScreenView.route,
      iconData: Icons.notifications,
    ),
    BottomNavigationModel(
      title: "Profile",
      routeName: BottomScreenView.route,
      iconData: Icons.person,
    ),
  ];

  int _currentIndex = 0;

  bool _isHide = false;

  bool get isHide => _isHide;

  int get currentIndex => _currentIndex;

  set isHide(bool value) {
    _isHide = value;
    notifyListeners();
  }

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }
}
