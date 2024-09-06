import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/bloc/cubit/global_state.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/locale/app_locale.dart';
import '../core/routes/app_routes.dart';
import '../core/theme/app_theme.dart';

class ChefApp extends StatelessWidget {
  const ChefApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ar', 'EG'),
            ],
            locale: Locale(BlocProvider.of<GlobalCubit>(context).languageCode),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.initialRoute,
            onGenerateRoute: AppRoutes.generateRoutes,
            title: AppStrings.appName,
            theme: getAppLightTheme(),
          );
        },
      ),
    );
  }
}
