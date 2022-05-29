import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@Freezed()
class TaskModel with _$TaskModel {
  @HiveType(typeId: 1, adapterName: 'TaskModelAdapter')
  const factory TaskModel({
    @HiveField(0) required final String id,
    @HiveField(1) required final String title,
    @HiveField(2) required final String description,
    @HiveField(3) required final Duration duration,
  }) = _TaskModel;
}
