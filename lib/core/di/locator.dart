
import 'package:dio/dio.dart';
import 'package:flutter_puertorico_mvvm/core/data/datasources/api_service.dart';
import 'package:flutter_puertorico_mvvm/core/data/datasources/api_service_impl.dart';
import 'package:flutter_puertorico_mvvm/features/government/data/repositories/repository_impl.dart';
import 'package:flutter_puertorico_mvvm/features/government/domain/repositories/government_repository.dart';
import 'package:flutter_puertorico_mvvm/features/government/domain/usecases/get_government_data.dart';
import 'package:flutter_puertorico_mvvm/features/government/presentation/bloc/government_bloc.dart';
import 'package:flutter_puertorico_mvvm/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_puertorico_mvvm/features/municipalities/data/repositories/repository_impl.dart';
import 'package:flutter_puertorico_mvvm/features/municipalities/domain/repositories/municipalities_repository.dart';
import 'package:flutter_puertorico_mvvm/features/municipalities/domain/usecases/get_municipalities.dart';
import 'package:flutter_puertorico_mvvm/features/municipalities/presentation/bloc/municipalities_bloc.dart';
import 'package:flutter_puertorico_mvvm/features/schools/presentation/bloc/schools_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // Core
  locator.registerLazySingleton(() {
    final dio = Dio(BaseOptions(
      headers: {
        'Accept': 'application/json',
      },
    ));
    return dio;
  });
  locator.registerLazySingleton<ApiService>(() => ApiServiceImpl(locator()));

  // Features

  // Government
  locator.registerLazySingleton<GovernmentRepository>(
      () => GovernmentRepositoryImpl(locator()));
  locator.registerLazySingleton(() => GetGovernmentData(locator()));
  locator.registerFactory(() => GovernmentBloc(locator()));

  // Home
  locator.registerFactory(() => HomeBloc());

  // Municipalities
  locator.registerLazySingleton<MunicipalitiesRepository>(
      () => MunicipalitiesRepositoryImpl(locator()));
  locator.registerLazySingleton(() => GetMunicipalities(locator()));
  locator.registerFactory(() => MunicipalitiesBloc(locator()));

  // Schools
  locator.registerFactory(() => SchoolsBloc());
}
