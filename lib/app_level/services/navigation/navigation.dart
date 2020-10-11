import 'package:flutter/material.dart';

class NavigationService {
  NavigationService();

  GlobalKey<NavigatorState> rootNavKey = GlobalKey();

  NavigatorState get nav => rootNavKey.currentState;
}
