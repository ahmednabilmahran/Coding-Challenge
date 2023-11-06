import 'package:coding_challenge/app.dart';
import 'package:coding_challenge/core/injection_container.dart';
import 'package:coding_challenge/core/utils/bloc_observer.dart';
import 'package:coding_challenge/core/utils/database_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The entry point of the application.
///
/// This function initializes various essential parts of the app such as
/// dependency injection and database, and then runs the app.
Future<void> main() async {
  // Ensures that widget-binding is initialized.
  // This is required because plugins might be called before runApp.
  WidgetsFlutterBinding.ensureInitialized();

  // Asynchronously initialize dependencies and the Hive database.
  await Future.wait([
    configureDependencies(),
    DatabaseManager.initHive(),
  ]);

  // await DatabaseManager.clearData();

  // Set the global Bloc observer for better debugging and logging.
  Bloc.observer = AppBlocObserver();

  // Run the app.
  runApp(const CodingChallengeApp());
}
