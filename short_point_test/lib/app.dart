import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:short_point_test/config/routes/app_pages.dart';
import 'package:short_point_test/config/themes/app_theme.dart';
import 'package:short_point_test/config/themes/app_theme_dark.dart';
import 'package:short_point_test/core/injection_container.dart';
import 'package:short_point_test/core/utils/app_strings.dart';
import 'package:short_point_test/features/splash/domain/usecases/change_lang.dart';
import 'package:short_point_test/features/splash/domain/usecases/change_theme_mode.dart';
import 'package:short_point_test/features/splash/domain/usecases/get_saved_lang.dart';
import 'package:short_point_test/features/splash/domain/usecases/get_saved_theme_mode.dart';
import 'package:short_point_test/features/splash/presentation/controllers/main_cubit/main_cubit.dart';
import 'package:short_point_test/features/tasks/presentation/controllers/main_tasks/tasks_cubit.dart';
import 'package:short_point_test/generated/l10n.dart';
import 'package:sizer/sizer.dart';

/// The [ShortPointTestApp] class serves as the root of the application.
///
/// It sets up the necessary BlocProvider,
/// localization,
/// theme
/// and routing configurations.
class ShortPointTestApp extends StatelessWidget {
  /// Constructor
  const ShortPointTestApp({super.key});

  /// Builds the application widget tree.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit(
            getIt<GetSavedLangUseCase>(),
            getIt<ChangeLangUseCase>(),
            getIt<GetSavedThemeModeUseCase>(),
            getIt<ChangeThemeModeUseCase>(),
          )
            ..getSavedLang()
            ..getSavedThemeMode(),
        ),
        BlocProvider(
          create: (context) => TasksCubit(),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) =>
            BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return MaterialApp(
              title: AppStrings.appName,
              locale: Locale(MainCubit.get(context).currentLangCode),
              debugShowCheckedModeBanner: false,
              theme: AppTheme.theme(
                MainCubit.get(context).currentLangCode,
              ),
              darkTheme: AppThemeDark.theme(
                MainCubit.get(context).currentLangCode,
              ),
              themeMode: MainCubit.get(context).currentThemeMode,
              onGenerateRoute: AppRoutes.onGenerateRoute,
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
            );
          },
        ),
      ),
    );
  }
}
