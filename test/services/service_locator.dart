import 'package:get_it/get_it.dart';
import 'package:highlevel_assignment/services/local_storage_service.dart';

import 'mock_storage_service.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() async {
  getIt.allowReassignment = true;
  getIt.registerSingleton<LocalStorageService>(MockStorageService());
}
