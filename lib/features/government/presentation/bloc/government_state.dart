
import 'package:equatable/equatable.dart';
import 'package:flutter_puertorico_mvvm/features/government/data/models/government_response.dart';

abstract class GovernmentState extends Equatable {
  const GovernmentState();

  @override
  List<Object> get props => [];
}

class GovernmentInitial extends GovernmentState {}

class GovernmentLoading extends GovernmentState {}

class GovernmentLoaded extends GovernmentState {
  final GovernmentResponse governmentResponse;

  const GovernmentLoaded(this.governmentResponse);

  @override
  List<Object> get props => [governmentResponse];
}

class GovernmentError extends GovernmentState {
  final String message;

  const GovernmentError(this.message);

  @override
  List<Object> get props => [message];
}
