
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../featuers/home/data/repos/home_repo_imp.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),
  );
  getIt.registerSingleton<HomeRepoImplmentation>(
    HomeRepoImplmentation(
      getIt.get<ApiService>(),
    ),
  );
}
