import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pie_chart/pie_chart.dart' as pie_chart;
import 'package:sizer/sizer.dart';
import 'package:wiet_test_app/core/constants/extension/int_extension.dart';
import 'package:wiet_test_app/core/constants/extension/theme_getter_extension.dart';
import 'package:wiet_test_app/core/constants/project_paddings.dart';
import 'package:wiet_test_app/core/constants/project_strings.dart';
import 'package:wiet_test_app/core/helper/hex_color.dart';
import 'package:wiet_test_app/core/widget/c_notify.dart';
import 'package:wiet_test_app/feature/cubit/data/data_cubit.dart';
import 'package:wiet_test_app/feature/model/cat_model/cat_model.dart';
import 'package:wiet_test_app/feature/model/result_model/result_model.dart';
import 'package:wiet_test_app/feature/model/tier_model/tier_model.dart';

import 'package:wiet_test_app/feature/view/home/home_view_inherited.dart';

///This widget is used to display donut chart and grid view
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ProjectStrings.homeAppBar),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _GridViewWidget(),
            SizedBox(height: 1.h),
            const _DonutChartWidget(),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}

class _DonutChartWidget extends StatelessWidget {
  const _DonutChartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentState = HomeViewInherited.of(context);
    return BlocSelector<DataCubit, DataState, List<TierModel?>?>(
      selector: (state) {
        return state.tier;
      },
      builder: (context, state) {
        if (state == null) {
          CNotify(title: 'Error', message: 'Failed to load data').show();
          return const SizedBox();
        }
        return Stack(
          alignment: Alignment.center,
          children: [
            pie_chart.PieChart(
              initialAngleInDegree: -90,
              chartValuesOptions: const pie_chart.ChartValuesOptions(showChartValues: false),
              legendOptions: const pie_chart.LegendOptions(showLegends: false),
              colorList: state.map((e) => HexColor(e!.bgColor ?? '')).toList(),
              chartRadius: 150.sp,
              ringStrokeWidth: 40,
              centerWidget: const _ChartCenterWidget(),
              chartType: pie_chart.ChartType.ring,
              dataMap: {
                '${state[0]?.tierName}': 1,
                '${state[1]?.tierName}': 1,
                '${state[2]?.tierName}': 1,
                '${state[3]?.tierName}': 1,
              },
            ),
            _CircularTierName(tier: state),
            _CircularTierPoint(tier: state),
            BlocSelector<DataCubit, DataState, ResultModel?>(
              selector: (state) {
                return state.result;
              },
              builder: (context, result) {
                if (result == null) {
                  CNotify(title: 'Error', message: 'Failed to load data').show();
                  return const SizedBox.shrink();
                }
                return Positioned(
                  bottom: 22.5.h,
                  child: Transform.rotate(
                    alignment: Alignment.centerLeft,
                    angle: currentState.calculateMarker(result.tierPoints?.toDouble() ?? 0, state),
                    // angle: state.last!.minPoint! / 2000 / 2 * 3.14,
                    origin: Offset(0.sp, 74.sp), //! DON'T CHANGE THIS
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Transform.translate(
                            offset: Offset(-0.8.w, -20),
                            child: Container(
                              width: 10,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 5.h,
                          width: .3.h,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _GridViewWidget extends StatelessWidget {
  const _GridViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: BlocSelector<DataCubit, DataState, List<CatModel?>?>(
        selector: (state) {
          return state.cat;
        },
        builder: (context, state) {
          if (state == null) {
            CNotify(title: 'Error', message: 'Failed to load data').show();
            return const SizedBox.shrink();
          }
          return MasonryGridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.length,
            mainAxisSpacing: .5.h,
            crossAxisSpacing: 1.w,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              return Tooltip(
                triggerMode: TooltipTriggerMode.tap,
                message: 'Say hi to ${state[index]?.id}',
                child: Image.network(
                  state[index]?.url ?? '',
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// Widget to display the center of the pie chart
class _ChartCenterWidget extends StatelessWidget {
  const _ChartCenterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DataCubit, DataState, ResultModel?>(
      selector: (state) {
        return state.result;
      },
      builder: (context, result) {
        if (result == null) {
          CNotify(title: 'Error', message: 'Failed to load data').show();
          return const SizedBox.shrink();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              child: Padding(
                padding: ProjectPaddings.chartCenterPadding(),
                child: Column(
                  children: [
                    Text(
                      '${result.currentTier?.toUpperCase()}',
                      style: context.theme.textTheme.bodyLarge?.copyWith(fontSize: 12.sp, color: Colors.red),
                    ),
                    Text(
                      'TIER LEVEL',
                      style: context.theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            BlocSelector<DataCubit, DataState, int?>(
              selector: (state) {
                return state.creditsToNextTier;
              },
              builder: (context, creditsToNextTier) {
                if (creditsToNextTier == null) {
                  CNotify(title: 'Error', message: 'Failed to load data').show();
                  return const SizedBox.shrink();
                }
                return Column(
                  children: [
                    Text(
                      creditsToNextTier.toFormattedString(),
                      style: context.theme.textTheme.bodyLarge?.copyWith(fontSize: 18.sp),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 25.w),
                      child: Text(
                        ((result.tiers?.last.minPoint ?? 0) >= (result.tierPoints ?? 0))
                            ? ProjectStrings.creditsToNextTier.toUpperCase()
                            : ProjectStrings.totalCredits.toUpperCase(),
                        style: context.theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}

/// Widget to display the tier points in the pie chart
class _CircularTierPoint extends StatelessWidget {
  const _CircularTierPoint({
    required this.tier,
    super.key,
  });
  final List<TierModel?> tier;

  @override
  Widget build(BuildContext context) {
    return CircularText(
      radius: 90.sp,
      position: CircularTextPosition.outside,
      children: [
        TextItem(
          space: 5,
          startAngle: -12.sp,
          startAngleAlignment: StartAngleAlignment.end,
          text: Text('${tier[0]?.minPoint?.toFormattedString()}-${tier[0]?.maxPoint?.toFormattedString()} ', style: context.theme.textTheme.bodySmall),
        ),
        TextItem(
          space: 5,
          startAngle: 15.sp,
          startAngleAlignment: StartAngleAlignment.end,
          direction: CircularTextDirection.anticlockwise,
          text: Text('${tier[1]?.minPoint?.toFormattedString()}-${tier[1]?.maxPoint?.toFormattedString()} ', style: context.theme.textTheme.bodySmall),
        ),
        TextItem(
          space: 5,
          startAngle: 75.sp,
          startAngleAlignment: StartAngleAlignment.end,
          direction: CircularTextDirection.anticlockwise,
          text: Text('${tier[2]?.minPoint?.toFormattedString()}-${tier[2]?.maxPoint?.toFormattedString()} ', style: context.theme.textTheme.bodySmall),
        ),
        TextItem(
          space: 5,
          startAngle: -90.sp,
          startAngleAlignment: StartAngleAlignment.end,
          text: Text('${tier[3]?.minPoint?.toFormattedString()}+', style: context.theme.textTheme.bodySmall),
        ),
      ],
    );
  }
}

/// Widget to display the tier names in the pie chart
class _CircularTierName extends StatelessWidget {
  const _CircularTierName({
    required this.tier,
    super.key,
  });
  final List<TierModel?> tier;

  @override
  Widget build(BuildContext context) {
    return CircularText(
      radius: 82.sp,
      children: [
        TextItem(
          startAngle: -20.sp,
          space: 6,
          startAngleAlignment: StartAngleAlignment.end,
          text: Text(
            '${tier[0]?.tierName?.toUpperCase()}',
            style: context.theme.textTheme.bodyMedium?.copyWith(
              color: HexColor(tier[0]?.fontColor),
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
        ),
        TextItem(
          startAngle: 25.sp,
          space: 6,
          startAngleAlignment: StartAngleAlignment.end,
          direction: CircularTextDirection.anticlockwise,
          text: Text(
            '${tier[1]?.tierName?.toUpperCase()}',
            style: context.theme.textTheme.bodyMedium?.copyWith(
              color: HexColor(tier[1]?.fontColor),
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
        ),
        TextItem(
          startAngle: 82.sp,
          startAngleAlignment: StartAngleAlignment.end,
          space: 6,
          direction: CircularTextDirection.anticlockwise,
          text: Text(
            '${tier[2]?.tierName?.toUpperCase()}',
            style: context.theme.textTheme.bodyMedium?.copyWith(
              color: HexColor(tier[2]?.fontColor),
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
        ),
        TextItem(
          startAngle: -80.sp,
          startAngleAlignment: StartAngleAlignment.end,
          space: 6,
          text: Text(
            '${tier[3]?.tierName?.toUpperCase()}',
            style: context.theme.textTheme.bodyMedium?.copyWith(
              color: HexColor(tier[3]?.fontColor),
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
