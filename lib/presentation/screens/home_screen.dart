
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_puertorico_mvvm/di/locator.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/home_bloc.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/home_event.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/home_state.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<HomeBloc>()..add(LoadHomeData()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Puerto Rico'),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            // Navigation is handled here
          },
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  final category = state.categories[index];
                  IconData icon;
                  switch (category) {
                    case 'Government':
                      icon = Icons.account_balance;
                      break;
                    case 'Municipalities':
                      icon = Icons.location_city;
                      break;
                    case 'Schools':
                      icon = Icons.school;
                      break;
                    default:
                      icon = Icons.category;
                  }
                  return Card(
                    elevation: 2.0,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: ListTile(
                      leading: Icon(icon, color: Theme.of(context).primaryColor),
                      title: Text(category,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        final route = '/${category.toLowerCase()}';
                        context.push(route);
                      },
                    ),
                  );
                },
              );
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Welcome'));
            }
          },
        ),
      ),
    );
  }
}
