
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_puertorico_mvvm/core/di/locator.dart';
import 'package:flutter_puertorico_mvvm/features/municipalities/presentation/bloc/municipalities_bloc.dart';
import 'package:flutter_puertorico_mvvm/features/municipalities/presentation/bloc/municipalities_event.dart';
import 'package:flutter_puertorico_mvvm/features/municipalities/presentation/bloc/municipalities_state.dart';
import 'package:flutter_puertorico_mvvm/core/widgets/network_svg.dart';

class MunicipalitiesScreen extends StatelessWidget {
  const MunicipalitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator<MunicipalitiesBloc>()..add(LoadMunicipalitiesData()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Municipalities'),
        ),
        body: BlocBuilder<MunicipalitiesBloc, MunicipalitiesState>(
          builder: (context, state) {
            if (state is MunicipalitiesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MunicipalitiesLoaded) {
              return GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: state.municipalities.length,
                itemBuilder: (context, index) {
                  final municipality = state.municipalities[index];
                  return Card(
                    elevation: 2.0,
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: municipality.flag != null
                                ? NetworkSvg(
                                    url: municipality.flag!,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.flag, size: 50, color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              municipality.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is MunicipalitiesError) {
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
