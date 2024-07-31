import 'package:flutter/material.dart';
import 'package:wiet_test_app/core/constants/enum/tabs.dart';
import 'package:wiet_test_app/feature/view/home/home_view_inherited.dart';

/// This is extension for [Tabs]
extension TabsExtension on Tabs {
  /// This method is used to get the page for the tabs
  Widget getPage() {
    switch (this) {
      case Tabs.home:
        return const HomeViewHost();
    }
  }

  /// This method is used to get the tab title
  String tabTitle() {
    switch (this) {
      case Tabs.home:
        return 'Home';
    }
  }
}
