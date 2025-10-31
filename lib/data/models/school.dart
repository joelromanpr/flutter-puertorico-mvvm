import 'package:equatable/equatable.dart';

class School extends Equatable {
  final String name;
  final String level;

  const School({required this.name, required this.level});

  @override
  List<Object?> get props => [name, level];
}
