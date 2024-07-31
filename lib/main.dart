// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:wiet_test_app/core/widget/c_notify.dart';
import 'package:wiet_test_app/feature/cubit/data/data_cubit.dart';
import 'package:wiet_test_app/feature/view/splash/splash_view_inherited.dart';

/// This class is used to pass the state of app
/// created for [CNotify]
final navigator = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider<DataCubit>(
          create: (context) => DataCubit(),
          child: MaterialApp(
            title: 'Flutter Demo',
            navigatorKey: navigator,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.deepPurple,
              ),
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                bodyMedium: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                bodySmall: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
              ),
            ),
            home: const SplashViewHost(),
          ),
        );
      },
    );
  }
}
