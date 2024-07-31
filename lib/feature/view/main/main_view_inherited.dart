import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiet_test_app/core/constants/enum/tabs.dart';
import 'package:wiet_test_app/core/helper/ticker_provider_service.dart';
import 'package:wiet_test_app/feature/cubit/data/data_cubit.dart';
import 'package:wiet_test_app/feature/view/main/main_view.dart';

/// This class is used to pass the state of [MainViewHost] to [MainView]
final class MainViewInherited extends InheritedWidget {
  const MainViewInherited(this.data, {required super.child, super.key});
  final MainViewHostState data;

  static MainViewHostState of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<MainViewInherited>();
    if (result != null) {
      return result.data;
    } else {
      throw Exception('HomeViewInherited not found in context');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

/// This class is used to host the state of [MainView]
class MainViewHost extends StatefulWidget {
  const MainViewHost({super.key});

  @override
  State<MainViewHost> createState() => MainViewHostState();
}

class MainViewHostState extends State<MainViewHost> {
  // Add your state and logic here
  final TabController tabController = TabController(length: Tabs.values.length, vsync: tickerProviderService);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainViewInherited(
      this,
      child: BlocProvider.value(
        value: BlocProvider.of<DataCubit>(context),
        child: const MainView(),
      ),
    );
  }
}
