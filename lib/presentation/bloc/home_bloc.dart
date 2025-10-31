import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_puertorico_mvvm/domain/usecases/get_home_categories.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/home_event.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeCategories _getHomeCategories;

  HomeBloc(this._getHomeCategories) : super(HomeInitial()) {
    on<LoadHomeData>((event, emit) async {
      emit(HomeLoading());
      try {
        final categories = await _getHomeCategories();
        emit(HomeLoaded(categories));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });

    on<NavigateTo>((event, emit) {
      // Handle navigation logic here
    });
  }
}
