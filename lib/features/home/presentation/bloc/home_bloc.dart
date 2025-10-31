
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_puertorico_mvvm/features/home/presentation/bloc/home_event.dart';
import 'package:flutter_puertorico_mvvm/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadHomeData>((event, emit) {
      emit(HomeLoading());
      // In a real app, you'd fetch this from a use case
      final categories = [
        'Government',
        'Municipalities',
        'Schools',
        // Add more categories as needed
      ];
      emit(HomeLoaded(categories));
    });

    on<NavigateTo>((event, emit) {
      // Handle navigation logic here
    });
  }
}
