
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_puertorico_mvvm/domain/usecases/get_municipalities.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/municipalities_event.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/municipalities_state.dart';

class MunicipalitiesBloc extends Bloc<MunicipalitiesEvent, MunicipalitiesState> {
  final GetMunicipalities _getMunicipalities;

  MunicipalitiesBloc(this._getMunicipalities) : super(MunicipalitiesInitial()) {
    on<LoadMunicipalitiesData>((event, emit) async {
      emit(MunicipalitiesLoading());
      try {
        final municipalities = await _getMunicipalities();
        emit(MunicipalitiesLoaded(municipalities));
      } catch (e) {
        emit(MunicipalitiesError(e.toString()));
      }
    });
  }
}
