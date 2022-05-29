import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/tasks_screen.dart';
import 'stores/tasks_store.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => TasksStore(),
      child: MaterialApp(
        title: 'Potato Timer',
        theme: AppTheme.theme,
        home: const TasksScreen(),
      ),
    );
  }
}
