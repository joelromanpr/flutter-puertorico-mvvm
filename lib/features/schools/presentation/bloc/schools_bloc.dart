
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_puertorico_mvvm/features/schools/data/models/school.dart';
import 'package:flutter_puertorico_mvvm/features/schools/presentation/bloc/schools_event.dart';
import 'package:flutter_puertorico_mvvm/features/schools/presentation/bloc/schools_state.dart';

class SchoolsBloc extends Bloc<SchoolsEvent, SchoolsState> {
  SchoolsBloc() : super(SchoolsInitial()) {
    on<LoadSchoolsData>((event, emit) {
      emit(SchoolsLoading());
      final schools = [
        School(name: 'Dr. Pedro Albizu Campos', level: 'High School'),
        School(name: 'Eugenio Maria de Hostos', level: 'Elementary School'),
        School(name: 'Ramon Power y Giralt', level: 'Middle School'),
      ];
      emit(SchoolsLoaded(schools));
    });
  }
}
