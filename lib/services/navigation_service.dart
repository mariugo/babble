import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void removeAndNavigateToRoute(String _routeName) {
    navigatorKey.currentState?.popAndPushNamed(_routeName);
  }

  void navigateToRoute(String _routeName) {
    navigatorKey.currentState?.pushNamed(_routeName);
  }

  void navigateToScreen(Widget _screenName) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (BuildContext _context) => _screenName,
      ),
    );
  }

  void goBack() {
    navigatorKey.currentState?.pop();
  }
}
