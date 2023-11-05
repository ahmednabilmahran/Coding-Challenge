// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:short_point_test/config/routes/app_routes.dart';
import 'package:short_point_test/core/utils/sized_x.dart';
import 'package:short_point_test/features/tasks/presentation/controllers/main_tasks/tasks_cubit.dart';
import 'package:short_point_test/features/tasks/presentation/screens/main_tasks/widgets/custom_blue_container.dart';
import 'package:short_point_test/features/tasks/presentation/screens/main_tasks/widgets/custom_card.dart';
import 'package:short_point_test/features/tasks/presentation/screens/main_tasks/widgets/custom_floating_action_button.dart';
import 'package:short_point_test/features/tasks/presentation/screens/main_tasks/widgets/custom_lime_container.dart';
import 'package:sizer/sizer.dart';

class MainTasksScreen extends StatelessWidget {
  const MainTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.h),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.addTaskRoute);
        },
      ),
      body: Column(
        children: [
          const CustomBlueContainer(),
          const CustomLimeContainer(),
          SizedX.h3,
          BlocBuilder<TasksCubit, TasksState>(
            builder: (context, state) {
              if (state is TasksLoading) {
                return const CircularProgressIndicator();
              } else if (state is TasksLoaded) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: ListView.separated(
                      itemCount: state.tasks.length,
                      separatorBuilder: (context, index) => SizedX.h3,
                      itemBuilder: (context, index) {
                        final task = state.tasks[index];
                        return CustomCard(
                          task: task,
                        );
                      },
                    ),
                  ),
                );
              } else if (state is TasksError) {
                return Text('Error: ${state.message}');
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
