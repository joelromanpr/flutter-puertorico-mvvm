import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_puertorico_mvvm/data/models/municipality.dart';
import 'package:flutter_puertorico_mvvm/domain/usecases/get_municipalities.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/municipalities_bloc.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/municipalities_event.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/municipalities_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'municipalities_bloc_test.mocks.dart';

@GenerateMocks([GetMunicipalities])
void main() {
  late MunicipalitiesBloc bloc;
  late MockGetMunicipalities mockGetMunicipalities;

  setUp(() {
    mockGetMunicipalities = MockGetMunicipalities();
    bloc = MunicipalitiesBloc(mockGetMunicipalities);
  });

  final tMunicipalities = [
    const Municipality(name: 'San Juan', flagUrl: 'url1', coatOfArmsUrl: 'url2'),
  ];

  blocTest<MunicipalitiesBloc, MunicipalitiesState>(
    'emits [MunicipalitiesLoading, MunicipalitiesLoaded] when LoadMunicipalitiesData is added.',
    build: () {
      when(mockGetMunicipalities()).thenAnswer((_) async => tMunicipalities);
      return bloc;
    },
    act: (bloc) => bloc.add(LoadMunicipalitiesData()),
    expect: () => [
      MunicipalitiesLoading(),
      MunicipalitiesLoaded(tMunicipalities),
    ],
  );

  blocTest<MunicipalitiesBloc, MunicipalitiesState>(
    'emits [MunicipalitiesLoading, MunicipalitiesError] when LoadMunicipalitiesData is added and usecase throws an error.',
    build: () {
      when(mockGetMunicipalities()).thenThrow('error');
      return bloc;
    },
    act: (bloc) => bloc.add(LoadMunicipalitiesData()),
    expect: () => [
      MunicipalitiesLoading(),
      MunicipalitiesError('error'),
    ],
  );
}
