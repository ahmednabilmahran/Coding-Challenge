import 'package:coding_challenge/config/routes/app_routes.dart';
import 'package:coding_challenge/core/utils/app_strings.dart';
import 'package:coding_challenge/features/splash/presentation/screens/splash_screen.dart';
import 'package:coding_challenge/features/tasks/data/models/task.dart';
import 'package:coding_challenge/features/tasks/presentation/screens/add_task/add_task_screen.dart';
import 'package:coding_challenge/features/tasks/presentation/screens/edit_task/edit_task_screen.dart';
import 'package:coding_challenge/features/tasks/presentation/screens/main_tasks/main_tasks_screen.dart';
import 'package:flutter/material.dart';


/// A class that provides a centralized location for app-wide route settings.
class AppRoutes {
  /// This method is called when the app needs to generate a route.
  /// [routeSettings] contains the settings for the route to generate.
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // Route for the initial (splash) screen.
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
          settings: const RouteSettings(name: Routes.initialRoute),
        );

      // Route for the Tasks screen, with a fade transition.
      case Routes.tasksRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: const MainTasksScreen(),
            );
          },
          settings: const RouteSettings(name: Routes.tasksRoute),
          transitionDuration: Duration.zero,
        );

      case Routes.addTaskRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const AddTaskScreen();
          },
          settings: const RouteSettings(name: Routes.addTaskRoute),
        );

      case Routes.editTaskRoute:
        return MaterialPageRoute(
          builder: (context) {
            return EditTaskScreen(
              task: routeSettings.arguments! as Task,
            );
          },
          settings: const RouteSettings(name: Routes.editTaskRoute),
        );

      // Default case for undefined routes.
      default:
        return undefinedRoute();
    }
  }

  /// This method is called when an undefined route is navigated to.
  /// Returns a scaffold displaying a "no route found" message.
  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
      settings: const RouteSettings(name: 'undefinedRoute'),
    );
  }
}
