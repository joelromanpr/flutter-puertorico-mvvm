
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_puertorico_mvvm/core/di/locator.dart';
import 'package:flutter_puertorico_mvvm/features/schools/presentation/bloc/schools_bloc.dart';
import 'package:flutter_puertorico_mvvm/features/schools/presentation/bloc/schools_event.dart';
import 'package:flutter_puertorico_mvvm/features/schools/presentation/bloc/schools_state.dart';

class SchoolsScreen extends StatelessWidget {
  const SchoolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<SchoolsBloc>()..add(LoadSchoolsData()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Schools'),
        ),
        body: BlocBuilder<SchoolsBloc, SchoolsState>(
          builder: (context, state) {
            if (state is SchoolsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SchoolsLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: state.schools.length,
                itemBuilder: (context, index) {
                  final school = state.schools[index];
                  return Card(
                    elevation: 2.0,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: ListTile(
                      leading: const Icon(Icons.school),
                      title: Text(school.name,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(school.level),
                    ),
                  );
                },
              );
            } else if (state is SchoolsError) {
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
