import 'package:dio/dio.dart';
import 'package:flutter_puertorico_mvvm/data/datasources/api_service.dart';
import 'package:flutter_puertorico_mvvm/data/datasources/api_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_service_impl_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late ApiServiceImpl apiService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    apiService = ApiServiceImpl(mockDio);
  });

  const municipalitiesUrl =
      'https://pr-government-api.web.app/municipalities.json';
  const governmentUrl = 'https://pr-government-api.web.app/government.json';

  group('getMunicipalities', () {
    test(
        'should return a list of municipalities when the response code is 200 (success)',
        () async {
      // arrange
      final municipalitiesJson = [
        {'name': 'San Juan', 'flag_url': 'url1', 'coat_of_arms_url': 'url2'},
      ];
      when(mockDio.get(municipalitiesUrl)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: municipalitiesUrl),
          data: municipalitiesJson,
          statusCode: 200,
        ),
      );
      // act
      final result = await apiService.getMunicipalities();
      // assert
      expect(result, municipalitiesJson);
    });

    test('should throw a DioException when the response code is not 200', () async {
      // arrange
      when(mockDio.get(municipalitiesUrl)).thenThrow(
        DioException(requestOptions: RequestOptions(path: municipalitiesUrl)),
      );
      // act & assert
      expect(() => apiService.getMunicipalities(), throwsA(isA<DioException>()));
    });
  });

  group('getGovernmentData', () {
    test('should return government data when the response code is 200 (success)',
        () async {
      // arrange
      final governmentDataJson = {
        'executive_branch': {'name': '', 'description': ''},
        'legislative_branch': {'name': '', 'description': ''},
        'judicial_branch': {'name': '', 'description': ''},
        'federal_representation': {'name': '', 'description': ''},
      };
      when(mockDio.get(governmentUrl)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: governmentUrl),
          data: governmentDataJson,
          statusCode: 200,
        ),
      );
      // act
      final result = await apiService.getGovernmentData();
      // assert
      expect(result, governmentDataJson);
    });

    test('should throw a DioException when the response code is not 200', () async {
      // arrange
      when(mockDio.get(governmentUrl)).thenThrow(
        DioException(requestOptions: RequestOptions(path: governmentUrl)),
      );
      // act & assert
      expect(() => apiService.getGovernmentData(), throwsA(isA<DioException>()));
    });
  });
}
