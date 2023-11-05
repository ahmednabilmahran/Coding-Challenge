// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:short_point_test/config/routes/app_routes.dart';
import 'package:short_point_test/core/utils/sized_x.dart';
import 'package:short_point_test/core/widgets/custom_checkbox.dart';
import 'package:short_point_test/features/tasks/data/models/task.dart';
import 'package:short_point_test/features/tasks/presentation/controllers/main_tasks/tasks_cubit.dart';
import 'package:sizer/sizer.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.task,
    super.key,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 10.h,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xFFE6E6E6)),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
            ),
            child: Row(
              children: [
                CustomCheckbox(
                  isChecked: task.isChecked,
                  onChanged: (p0) {
                    task.isChecked = !task.isChecked;
                    TasksCubit.get(context).editTask(task);
                  },
                ),
                SizedX.w3,
                Text(
                  task.name,
                  style: task.isChecked
                      ? const TextStyle(
                          color: Color(0xFF8D8D8D),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough,
                        )
                      : const TextStyle(
                          color: Color(0xFF071C55),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.editTaskRoute,
                      arguments: task,
                    );
                  },
                  child: Container(
                    width: 51,
                    height: 45,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xFF071C55)),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          color: Color(0xFF071C55),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
