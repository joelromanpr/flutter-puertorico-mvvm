import 'package:flutter_puertorico_mvvm/data/datasources/api_service.dart';
import 'package:flutter_puertorico_mvvm/data/models/government_response.dart';
import 'package:flutter_puertorico_mvvm/data/models/municipality.dart';
import 'package:flutter_puertorico_mvvm/data/repositories/repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'repository_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late RepositoryImpl repository;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    repository = RepositoryImpl(mockApiService);
  });

  group('getMunicipalities', () {
    final tMunicipalityJson = [
      {'name': 'San Juan', 'flag_url': 'url1', 'coat_of_arms_url': 'url2'},
    ];
    final tMunicipalities = [
      const Municipality(name: 'San Juan', flagUrl: 'url1', coatOfArmsUrl: 'url2'),
    ];

    test(
      'should return list of municipalities when call to api service is successful',
      () async {
        // arrange
        when(mockApiService.getMunicipalities())
            .thenAnswer((_) async => tMunicipalityJson);
        // act
        final result = await repository.getMunicipalities();
        // assert
        expect(result, tMunicipalities);
        verify(mockApiService.getMunicipalities());
        verifyNoMoreInteractions(mockApiService);
      },
    );
  });

  group('getGovernmentData', () {
    final tGovernmentDataJson = {
      'executive_branch': {'name': '', 'description': ''},
      'legislative_branch': {'name': '', 'description': ''},
      'judicial_branch': {'name': '', 'description': ''},
      'federal_representation': {'name': '', 'description': ''},
    };
    final tGovernmentResponse = GovernmentResponse.fromJson(tGovernmentDataJson);

    test(
      'should return government data when call to api service is successful',
      () async {
        // arrange
        when(mockApiService.getGovernmentData())
            .thenAnswer((_) async => tGovernmentDataJson);
        // act
        final result = await repository.getGovernmentData();
        // assert
        expect(result, tGovernmentResponse);
        verify(mockApiService.getGovernmentData());
        verifyNoMoreInteractions(mockApiService);
      },
    );
  });
}
