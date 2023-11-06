// ignore_for_file: public_member_api_docs

import 'package:coding_challenge/core/utils/database_manager.dart';
import 'package:coding_challenge/features/tasks/data/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial()) {
    loadTasks();
  }

  TextEditingController addTaskController = TextEditingController();

  GlobalKey<FormState> addTaskFormKey = GlobalKey();

  DatabaseManager databaseManager = DatabaseManager();
  static TasksCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> loadTasks() async {
    emit(TasksLoading());
    try {
      final tasks = await databaseManager.getAllTasks();
      emit(TasksLoaded(tasks));
    } catch (e) {
      emit(TasksError(e.toString()));
    }
  }

  Future<void> addTask(Task task) async {
    if (addTaskFormKey.currentState!.validate()) {
      await databaseManager.addTask(task);
      await loadTasks(); // Refresh the list after adding
    }
  }

  Future<void> editTask(Task task) async {
    await databaseManager.editTask(
      task: task,
      newName: task.name,
      isChecked: task.isChecked,
    );
    await loadTasks(); // Refresh the list after editing
  }
}
