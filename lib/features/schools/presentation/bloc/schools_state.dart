
import 'package:equatable/equatable.dart';
import 'package:flutter_puertorico_mvvm/features/schools/data/models/school.dart';

abstract class SchoolsState extends Equatable {
  const SchoolsState();

  @override
  List<Object> get props => [];
}

class SchoolsInitial extends SchoolsState {}

class SchoolsLoading extends SchoolsState {}

class SchoolsLoaded extends SchoolsState {
  final List<School> schools;

  const SchoolsLoaded(this.schools);

  @override
  List<Object> get props => [schools];
}

class SchoolsError extends SchoolsState {
  final String message;

  const SchoolsError(this.message);

  @override
  List<Object> get props => [message];
}
