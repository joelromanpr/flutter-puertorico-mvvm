
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_puertorico_mvvm/features/government/domain/usecases/get_government_data.dart';
import 'package:flutter_puertorico_mvvm/features/government/presentation/bloc/government_event.dart';
import 'package:flutter_puertorico_mvvm/features/government/presentation/bloc/government_state.dart';

class GovernmentBloc extends Bloc<GovernmentEvent, GovernmentState> {
  final GetGovernmentData _getGovernmentData;

  GovernmentBloc(this._getGovernmentData) : super(GovernmentInitial()) {
    on<LoadGovernmentData>((event, emit) async {
      emit(GovernmentLoading());
      try {
        final governmentResponse = await _getGovernmentData();
        emit(GovernmentLoaded(governmentResponse));
      } catch (e) {
        emit(GovernmentError(e.toString()));
      }
    });
  }
}
