import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiet_test_app/feature/cubit/data/data_cubit.dart';
import 'package:wiet_test_app/feature/model/tier_model.dart';
import 'package:wiet_test_app/feature/view/home/home_view.dart';

/// This class is used to pass the state of [HomeViewHost] to [HomeView]
final class HomeViewInherited extends InheritedWidget {
  const HomeViewInherited(this.data, {required super.child, super.key});
  final HomeViewHostState data;

  static HomeViewHostState of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<HomeViewInherited>();
    if (result != null) {
      return result.data;
    } else {
      throw Exception('TestViewInherited not found in context');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

/// This class is used to host the state of [HomeView]
class HomeViewHost extends StatefulWidget {
  const HomeViewHost({super.key});

  @override
  State<HomeViewHost> createState() => HomeViewHostState();
}

class HomeViewHostState extends State<HomeViewHost> {
  // Add your state and logic here
  @override
  void initState() {
    super.initState();
  }

  /// This function is used to calculate the marker position
  double calculateMarker(double value, List<TierModel?> tiers) {
    for (final tier in tiers) {
      if (value >= tier!.minPoint! && value <= tier.maxPoint!) {
        return (value - tier.minPoint!) / (tier.maxPoint! - tier.minPoint!) * (3.14 / 2) + (tiers.indexOf(tier) * 3.14 / 2);
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<DataCubit>(context)..setCreditsToNextTier(),
      child: HomeViewInherited(this, child: const HomeView()),
    );
  }
}
