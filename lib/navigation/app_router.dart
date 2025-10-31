
import 'package:go_router/go_router.dart';
import 'package:flutter_puertorico_mvvm/presentation/screens/home_screen.dart';
import 'package:flutter_puertorico_mvvm/presentation/screens/government_screen.dart';
import 'package:flutter_puertorico_mvvm/presentation/screens/municipalities_screen.dart';
import 'package:flutter_puertorico_mvvm/presentation/screens/schools_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/government',
      builder: (context, state) => const GovernmentScreen(),
    ),
    GoRoute(
      path: '/municipalities',
      builder: (context, state) => const MunicipalitiesScreen(),
    ),
    GoRoute(
      path: '/schools',
      builder: (context, state) => const SchoolsScreen(),
    ),
  ],
);
