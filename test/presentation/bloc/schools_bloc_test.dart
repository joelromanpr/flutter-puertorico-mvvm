import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/schools_bloc.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/schools_event.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/schools_state.dart';
import 'package:flutter_puertorico_mvvm/data/models/school.dart';

void main() {
  late SchoolsBloc bloc;

  setUp(() {
    bloc = SchoolsBloc();
  });

  final schools = [
    School(name: 'Dr. Pedro Albizu Campos', level: 'High School'),
    School(name: 'Eugenio Maria de Hostos', level: 'Elementary School'),
    School(name: 'Ramon Power y Giralt', level: 'Middle School'),
  ];

  blocTest<SchoolsBloc, SchoolsState>(
    'emits [SchoolsLoading, SchoolsLoaded] when LoadSchoolsData is added.',
    build: () => bloc,
    act: (bloc) => bloc.add(LoadSchoolsData()),
    expect: () => [
      SchoolsLoading(),
      SchoolsLoaded(schools),
    ],
  );
}
