// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:short_point_test/core/utils/database_manager.dart';
import 'package:short_point_test/features/tasks/data/models/task.dart';

part 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit() : super(EditTaskInitial());

  TextEditingController editTaskController = TextEditingController();

  GlobalKey<FormState> editTaskFormKey = GlobalKey();

  DatabaseManager databaseManager = DatabaseManager();
  static EditTaskCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> editTask(Task task) async {
    if (editTaskFormKey.currentState!.validate()) {
      await databaseManager.editTask(
        task: task,
        newName: editTaskController.text,
        isChecked: task.isChecked,
      );
      emit(EditTaskLoaded());
    }
  }
}
