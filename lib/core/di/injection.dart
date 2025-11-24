import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_trainer/core/service/datasource/local/local_service.dart';
import 'package:my_trainer/core/service/datasource/remote/api_client.dart';
import 'package:my_trainer/core/service/datasource/remote/network_checker.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {

  sl.registerLazySingleton<Dio>(() => Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  )));

  sl.registerLazySingleton<NetworkChecker>(() => NetworkChecker());
  sl.registerLazySingleton<LocalService>(() => LocalService());

  sl.registerLazySingleton<ApiClient>(() => ApiClient(
    dio: sl<Dio>(),
    networkChecker: sl<NetworkChecker>(),
    localService: sl<LocalService>()
  ));
}
