import 'package:get_it/get_it.dart';

import 'local_storage_service.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() async {
  getIt.registerSingleton<LocalStorageService>(LocalStorageService());
}
