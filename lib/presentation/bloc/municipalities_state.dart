
import 'package:equatable/equatable.dart';
import 'package:flutter_puertorico_mvvm/data/models/municipality.dart';

abstract class MunicipalitiesState extends Equatable {
  const MunicipalitiesState();

  @override
  List<Object> get props => [];
}

class MunicipalitiesInitial extends MunicipalitiesState {}

class MunicipalitiesLoading extends MunicipalitiesState {}

class MunicipalitiesLoaded extends MunicipalitiesState {
  final List<Municipality> municipalities;

  const MunicipalitiesLoaded(this.municipalities);

  @override
  List<Object> get props => [municipalities];
}

class MunicipalitiesError extends MunicipalitiesState {
  final String message;

  const MunicipalitiesError(this.message);

  @override
  List<Object> get props => [message];
}
