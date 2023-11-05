// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:short_point_test/core/utils/sized_x.dart';
import 'package:short_point_test/core/widgets/custom_app_bar.dart';
import 'package:short_point_test/core/widgets/custom_button.dart';
import 'package:short_point_test/core/widgets/custom_padding.dart';
import 'package:short_point_test/core/widgets/custom_textfield.dart';
import 'package:short_point_test/features/tasks/data/models/task.dart';
import 'package:short_point_test/features/tasks/presentation/controllers/main_tasks/tasks_cubit.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'Add New Task',
        haveBackButton: true,
      ),
      body: SafeArea(
        child: CustomPadding(
          child: BlocBuilder<TasksCubit, TasksState>(
            builder: (context, state) {
              return Form(
                key: TasksCubit.get(context).addTaskFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedX.h2,
                    CustomTextField(
                      controller: TasksCubit.get(context).addTaskController,
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
                        TasksCubit.get(context).addTask(
                          Task(
                            name:
                                TasksCubit.get(context).addTaskController.text,
                          ),
                        );
                        TasksCubit.get(context).addTaskController.clear();
                        Navigator.pop(context);
                      },
                      buttonText: 'Done',
                      isFilled: true,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
