
import 'package:flutter_puertorico_mvvm/core/data/datasources/api_service.dart';
import 'package:flutter_puertorico_mvvm/features/municipalities/data/models/municipality.dart';
import 'package:flutter_puertorico_mvvm/features/municipalities/domain/repositories/municipalities_repository.dart';

class MunicipalitiesRepositoryImpl implements MunicipalitiesRepository {
  final ApiService _apiService;

  MunicipalitiesRepositoryImpl(this._apiService);

  @override
  Future<List<Municipality>> getMunicipalities() async {
    final data = await _apiService.getMunicipalities();
    return data.map((json) => Municipality.fromJson(json)).toList();
  }
}
