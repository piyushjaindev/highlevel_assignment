import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';

@Freezed()
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required final String id,
    required final String title,
    required final String description,
    required final Duration duration,
  }) = _TaskModel;
}
