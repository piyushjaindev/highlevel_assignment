import 'dart:developer';

import 'package:highlevel_assignment/models/task_model.dart';
import 'package:highlevel_assignment/services/local_storage_service.dart';

class MockStorageService implements LocalStorageService {
  @override
  List<TaskModel> activeTasks = [];

  @override
  List<TaskModel> completedTasks = [];

  @override
  Future<void> init() async {
    log('init called');
  }
}
