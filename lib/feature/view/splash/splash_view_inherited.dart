import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiet_test_app/core/helper/navigator_manager.dart';
import 'package:wiet_test_app/core/widget/c_notify.dart';
import 'package:wiet_test_app/feature/cubit/data/data_cubit.dart';
import 'package:wiet_test_app/feature/view/main/main_view_inherited.dart';
import 'package:wiet_test_app/feature/view/splash/splash_view.dart';

/// This class is used to pass the state of [SplashViewHost] to [SplashView]
final class SplashViewInherited extends InheritedWidget {
  const SplashViewInherited(this.data, {required super.child, super.key});
  final SplashViewHostState data;

  static SplashViewHostState of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<SplashViewInherited>();
    if (result != null) {
      return result.data;
    } else {
      throw Exception('SplashViewInherited not found in context');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

/// This class is used to host the state of [SplashView]
class SplashViewHost extends StatefulWidget {
  const SplashViewHost({super.key});

  @override
  State<SplashViewHost> createState() => SplashViewHostState();
}

class SplashViewHostState extends State<SplashViewHost> with NavigatorManager {
  // Add your state and logic here
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkIsOnBoardingComplete());
  }

  void _checkIsOnBoardingComplete() {
    Future.delayed(const Duration(seconds: 2), _checkIsOnBoarding);
  }

  void _checkIsOnBoarding() {
    context.read<DataCubit>().init().then(
      (value) {
        if (context.read<DataCubit>().state.data?.isSuccess ?? false) {
          navigateToPageReplaced(context, const MainViewHost());
        } else {
          CNotify(title: 'Error', message: 'Failed to load data').show();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SplashViewInherited(this, child: const SplashView());
  }
}
