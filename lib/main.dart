import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/tasks_screen.dart';
import 'services/local_storage_service.dart';
import 'services/service_locator.dart';
import 'states/tasks_list_state.dart';
import 'utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await getIt<LocalStorageService>().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<TasksListState>(
      create: (_) => TasksListState(),
      child: MaterialApp(
        title: 'Potato Timer',
        theme: AppTheme.theme,
        home: const TasksScreen(),
      ),
    );
  }
}
