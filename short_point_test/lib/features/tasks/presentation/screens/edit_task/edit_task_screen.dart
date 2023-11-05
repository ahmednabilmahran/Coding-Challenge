// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:short_point_test/core/utils/sized_x.dart';
import 'package:short_point_test/core/widgets/custom_app_bar.dart';
import 'package:short_point_test/core/widgets/custom_button.dart';
import 'package:short_point_test/core/widgets/custom_padding.dart';
import 'package:short_point_test/core/widgets/custom_textfield.dart';
import 'package:short_point_test/features/tasks/data/models/task.dart';
import 'package:short_point_test/features/tasks/presentation/controllers/edit_task/edit_task_cubit.dart';
import 'package:short_point_test/features/tasks/presentation/controllers/main_tasks/tasks_cubit.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({required this.task, super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditTaskCubit(),
      child: BlocConsumer<EditTaskCubit, EditTaskState>(
        listener: (context, state) async {
          if (state is EditTaskLoaded) {
            await TasksCubit.get(context).loadTasks();
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          EditTaskCubit.get(context).editTaskController.text = task.name;
          return Scaffold(
            appBar: customAppBar(
              context: context,
              title: 'Edit Task',
              haveBackButton: true,
            ),
            body: SafeArea(
              child: CustomPadding(
                child: Form(
                  key: EditTaskCubit.get(context).editTaskFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedX.h2,
                      CustomTextField(
                        controller:
                            EditTaskCubit.get(context).editTaskController,
                        label: 'Task Name',
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        useBorder: true,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Please enter task name';
                          }
                          return null;
                        },
                      ),
                      const Spacer(),
                      CustomButton(
                        onPressed: () {
                          EditTaskCubit.get(context).editTask(
                            task,
                          );
                        },
                        buttonText: 'Done',
                        isFilled: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
