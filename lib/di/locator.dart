
import 'package:dio/dio.dart';
import 'package:flutter_puertorico_mvvm/data/datasources/api_service.dart';
import 'package:flutter_puertorico_mvvm/data/datasources/api_service_impl.dart';
import 'package:flutter_puertorico_mvvm/data/repositories/repository_impl.dart';
import 'package:flutter_puertorico_mvvm/domain/repositories/repository.dart';
import 'package:flutter_puertorico_mvvm/domain/usecases/get_government_data.dart';
import 'package:flutter_puertorico_mvvm/domain/usecases/get_municipalities.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/government_bloc.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/home_bloc.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/municipalities_bloc.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/schools_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // Register your services and view models here
  locator.registerLazySingleton(() {
    final dio = Dio(BaseOptions(
      headers: {
        'Accept': 'application/json',
      },
    ));
    return dio;
  });
  locator.registerLazySingleton<ApiService>(() => ApiServiceImpl(locator()));
  locator.registerLazySingleton<Repository>(() => RepositoryImpl(locator()));

  // Use Cases
  locator.registerLazySingleton(() => GetGovernmentData(locator()));
  locator.registerLazySingleton(() => GetMunicipalities(locator()));

  // BLoCs
  locator.registerFactory(() => HomeBloc());
  locator.registerFactory(() => GovernmentBloc(locator()));
  locator.registerFactory(() => MunicipalitiesBloc(locator()));
  locator.registerFactory(() => SchoolsBloc());
}
