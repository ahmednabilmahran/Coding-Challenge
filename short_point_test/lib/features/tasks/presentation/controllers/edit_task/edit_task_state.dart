// ignore_for_file: public_member_api_docs

part of 'edit_task_cubit.dart';

abstract class EditTaskState {}

class EditTaskInitial extends EditTaskState {}

class EditTaskLoaded extends EditTaskState {}

class EditTaskLoading extends EditTaskState {}

class EditTaskError extends EditTaskState {
  EditTaskError(this.message);
  final String message;
}
