import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_puertorico_mvvm/domain/usecases/get_home_categories.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/home_bloc.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/home_event.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([GetHomeCategories])
void main() {
  late HomeBloc bloc;
  late MockGetHomeCategories mockGetHomeCategories;

  setUp(() {
    mockGetHomeCategories = MockGetHomeCategories();
    bloc = HomeBloc(mockGetHomeCategories);
  });

  final categories = ['Government', 'Municipalities', 'Schools'];

  blocTest<HomeBloc, HomeState>(
    'emits [HomeLoading, HomeLoaded] when LoadHomeData is added.',
    build: () {
      when(mockGetHomeCategories()).thenAnswer((_) async => categories);
      return bloc;
    },
    act: (bloc) => bloc.add(LoadHomeData()),
    expect: () => [
      HomeLoading(),
      HomeLoaded(categories),
    ],
  );
}
