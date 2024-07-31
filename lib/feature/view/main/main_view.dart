import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wiet_test_app/core/constants/enum/tabs.dart';
import 'package:wiet_test_app/core/constants/extension/tab_extension.dart';
import 'package:wiet_test_app/feature/view/main/main_view_inherited.dart';

/// This widget used to display bottom navigation bar and tab bar view
class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    final currentState = MainViewInherited.of(context);
    return DefaultTabController(
      length: Tabs.values.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: TabBar(
          controller: currentState.tabController,
          tabs: Tabs.values.map(
            (e) {
              return Tab(
                height: 8.h,
                text: e.tabTitle(),
              );
            },
          ).toList(),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: currentState.tabController,
          children: Tabs.values.map(
            (e) {
              return e.getPage();
            },
          ).toList(),
        ),
      ),
    );
  }
}
