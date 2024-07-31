import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

/// ProjectPaddings is a class that contains padding for the project.
class ProjectPaddings extends EdgeInsets {
  ///chartCenterPadding is a padding for the chart center.
  ProjectPaddings.chartCenterPadding() : super.all(5.sp);

  ///gridViewPadding is a padding for the grid view.
  ProjectPaddings.gridViewPadding() : super.all(2.sp);
}
