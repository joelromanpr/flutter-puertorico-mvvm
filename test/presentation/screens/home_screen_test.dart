import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_puertorico_mvvm/di/locator.dart';
import 'package:flutter_puertorico_mvvm/domain/usecases/get_home_categories.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/home_bloc.dart';
import 'package:flutter_puertorico_mvvm/presentation/screens/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../bloc/home_bloc_test.mocks.dart';

// Re-using the mock from the BLoC test

void main() {
  late MockGetHomeCategories mockGetHomeCategories;

  setUp(() {
    mockGetHomeCategories = MockGetHomeCategories();
    // Unregister the real dependencies and register our test-specific ones
    locator.reset();
    locator.registerLazySingleton<GetHomeCategories>(() => mockGetHomeCategories);
    locator.registerFactory<HomeBloc>(() => HomeBloc(locator()));
  });

  final categories = ['Government', 'Municipalities', 'Schools'];

  testWidgets('should display a list of categories when state is HomeLoaded',
      (WidgetTester tester) async {
    // arrange
    when(mockGetHomeCategories()).thenAnswer((_) async => categories);

    // act
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    // Let the BLoC emit the loading state
    await tester.pump();
    // Let the BLoC emit the loaded state
    await tester.pump();

    // assert
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Government'), findsOneWidget);
    expect(find.text('Municipalities'), findsOneWidget);
    expect(find.text('Schools'), findsOneWidget);
  });
}
