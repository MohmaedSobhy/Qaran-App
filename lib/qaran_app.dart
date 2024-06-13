import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hafiz_app/Feature/get_started/presentation/screens/get_started_screen.dart';
import 'package:hafiz_app/core/routes/app_route.dart';
import 'package:hafiz_app/core/styles/theme/app_theme.dart';
import 'package:hafiz_app/core/styles/theme/controller/app_theme_cubit.dart';

class QaranApp extends StatelessWidget {
  const QaranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeCubit.instanse..checkTheme(),
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const GetStartedScreen(),
            onGenerateRoute: AppRoute.onGenerateRoute,
            initialRoute: AppRoute.getStartedScreen,
            theme: (state is LightThemeState)
                ? AppTheme.lightTheme
                : AppTheme.darkTheme,
          );
        },
      ),
    );
  }
}
