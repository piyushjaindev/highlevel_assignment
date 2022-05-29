import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../models/task_model.dart';
import '../utils/duration_type_adapter.dart';

class LocalStorageService {
  late Box<List> _box;

  Future<void> init() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    Hive.registerAdapter(TaskModelAdapter());
    Hive.registerAdapter(DurationTypeAdapter());
    _box = await Hive.openBox<List>('box');
  }

  List<TaskModel> get activeTasks {
    log(_box.get('activeTasks').toString(), name: 'active tasks');

    return _box.get('activeTasks', defaultValue: [])!.cast<TaskModel>();
  }

  List<TaskModel> get completedTasks {
    log(_box.get('completedTasks').toString(), name: 'completed tasks');
    return _box.get('completedTasks', defaultValue: [])!.cast<TaskModel>();
  }

  set activeTasks(List<TaskModel> tasks) {
    _box.put('activeTasks', tasks);
  }

  set completedTasks(List<TaskModel> tasks) {
    _box.put('completedTasks', tasks);
  }
}
