
import 'package:dio/dio.dart';
import 'package:flutter_puertorico_mvvm/core/data/datasources/api_service.dart';

class ApiServiceImpl implements ApiService {
  final Dio _dio;

  ApiServiceImpl(this._dio);

  @override
  Future<Map<String, dynamic>> getGovernmentData() async {
    final response = await _dio.get('https://pr-government-api.web.app/government.json');
    return response.data ?? {};
  }

  @override
  Future<List<dynamic>> getMunicipalities() async {
    final response = await _dio.get('https://pr-government-api.web.app/municipalities.json');
    return response.data ?? [];
  }
}
