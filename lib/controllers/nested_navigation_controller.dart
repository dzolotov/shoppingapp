import 'package:flutter/material.dart';

class NestedShopNavigationController {
  GlobalKey<NavigatorState> _key = GlobalKey();

  GlobalKey<NavigatorState> get key => _key;

  void gotoPage(String name) => _key.currentState?.pushNamed(name);
}

class NestedProfileNavigationController {
  GlobalKey<NavigatorState> _key = GlobalKey();

  GlobalKey<NavigatorState> get key => _key;

  void gotoPage(String name) => _key.currentState?.pushNamed(name);
}
