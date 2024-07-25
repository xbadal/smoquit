import 'package:get_it/get_it.dart';

import '../repository/repository.dart';
import '../service/storage_service.dart';
import 'dio_injector.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  final storageService = await StorageService.getInstance();
  locator.registerSingleton<StorageService>(storageService);
  locator.registerSingleton<DioInjector>(DioInjector());
  locator.registerLazySingleton(() => ApiRepository());
}
