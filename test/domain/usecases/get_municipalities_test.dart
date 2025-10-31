import 'package:flutter_puertorico_mvvm/data/models/municipality.dart';
import 'package:flutter_puertorico_mvvm/domain/repositories/repository.dart';
import 'package:flutter_puertorico_mvvm/domain/usecases/get_municipalities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_municipalities_test.mocks.dart';

@GenerateMocks([Repository])
void main() {
  late GetMunicipalities usecase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    usecase = GetMunicipalities(mockRepository);
  });

  final tMunicipalities = [
    const Municipality(name: 'San Juan', flagUrl: 'url1', coatOfArmsUrl: 'url2'),
    const Municipality(name: 'Ponce', flagUrl: 'url3', coatOfArmsUrl: 'url4'),
  ];

  test(
    'should get a list of municipalities from the repository',
    () async {
      // arrange
      when(mockRepository.getMunicipalities())
          .thenAnswer((_) async => tMunicipalities);
      // act
      final result = await usecase();
      // assert
      expect(result, tMunicipalities);
      verify(mockRepository.getMunicipalities());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
