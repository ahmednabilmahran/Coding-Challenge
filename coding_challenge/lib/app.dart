import 'package:coding_challenge/config/routes/app_pages.dart';
import 'package:coding_challenge/config/themes/app_theme.dart';
import 'package:coding_challenge/config/themes/app_theme_dark.dart';
import 'package:coding_challenge/core/injection_container.dart';
import 'package:coding_challenge/core/utils/app_strings.dart';
import 'package:coding_challenge/features/splash/domain/usecases/change_lang.dart';
import 'package:coding_challenge/features/splash/domain/usecases/change_theme_mode.dart';
import 'package:coding_challenge/features/splash/domain/usecases/get_saved_lang.dart';
import 'package:coding_challenge/features/splash/domain/usecases/get_saved_theme_mode.dart';
import 'package:coding_challenge/features/splash/presentation/controllers/main_cubit/main_cubit.dart';
import 'package:coding_challenge/features/tasks/presentation/controllers/main_tasks/tasks_cubit.dart';
import 'package:coding_challenge/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';

/// The [CodingChallengeApp] class serves as the root of the application.
///
/// It sets up the necessary BlocProvider,
/// localization,
/// theme
/// and routing configurations.
class CodingChallengeApp extends StatelessWidget {
  /// Constructor
  const CodingChallengeApp({super.key});

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
