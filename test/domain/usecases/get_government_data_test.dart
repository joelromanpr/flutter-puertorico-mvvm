import 'package:flutter_puertorico_mvvm/data/models/government_response.dart';
import 'package:flutter_puertorico_mvvm/domain/repositories/repository.dart';
import 'package:flutter_puertorico_mvvm/domain/usecases/get_government_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_government_data_test.mocks.dart';

@GenerateMocks([Repository])
void main() {
  late GetGovernmentData usecase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    usecase = GetGovernmentData(mockRepository);
  });

  final tGovernmentResponse = GovernmentResponse(
    executiveBranch: const GovernmentBranch(name: '', description: ''),
    legislativeBranch: const GovernmentBranch(name: '', description: ''),
    judicialBranch: const GovernmentBranch(name: '', description: ''),
    federalRepresentation: const GovernmentBranch(name: '', description: ''),
  );

  test(
    'should get government data from the repository',
    () async {
      // arrange
      when(mockRepository.getGovernmentData())
          .thenAnswer((_) async => tGovernmentResponse);
      // act
      final result = await usecase();
      // assert
      expect(result, tGovernmentResponse);
      verify(mockRepository.getGovernmentData());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
