import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_puertorico_mvvm/data/models/government_response.dart';
import 'package:flutter_puertorico_mvvm/domain/usecases/get_government_data.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/government_bloc.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/government_event.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/government_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'government_bloc_test.mocks.dart';

@GenerateMocks([GetGovernmentData])
void main() {
  late GovernmentBloc bloc;
  late MockGetGovernmentData mockGetGovernmentData;

  setUp(() {
    mockGetGovernmentData = MockGetGovernmentData();
    bloc = GovernmentBloc(mockGetGovernmentData);
  });

  final tGovernmentResponse = GovernmentResponse(
    executiveBranch: const GovernmentBranch(name: '', description: ''),
    legislativeBranch: const GovernmentBranch(name: '', description: ''),
    judicialBranch: const GovernmentBranch(name: '', description: ''),
    federalRepresentation: const GovernmentBranch(name: '', description: ''),
  );

  blocTest<GovernmentBloc, GovernmentState>(
    'emits [GovernmentLoading, GovernmentLoaded] when LoadGovernmentData is added.',
    build: () {
      when(mockGetGovernmentData()).thenAnswer((_) async => tGovernmentResponse);
      return bloc;
    },
    act: (bloc) => bloc.add(LoadGovernmentData()),
    expect: () => [
      GovernmentLoading(),
      GovernmentLoaded(tGovernmentResponse),
    ],
  );

  blocTest<GovernmentBloc, GovernmentState>(
    'emits [GovernmentLoading, GovernmentError] when LoadGovernmentData is added and usecase throws an error.',
    build: () {
      when(mockGetGovernmentData()).thenThrow('error');
      return bloc;
    },
    act: (bloc) => bloc.add(LoadGovernmentData()),
    expect: () => [
      GovernmentLoading(),
      GovernmentError('error'),
    ],
  );
}
