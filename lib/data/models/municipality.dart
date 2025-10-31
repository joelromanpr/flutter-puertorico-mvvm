import 'package:equatable/equatable.dart';

class Municipality extends Equatable {
  final String name;
  final String flagUrl;
  final String coatOfArmsUrl;

  const Municipality({
    required this.name,
    required this.flagUrl,
    required this.coatOfArmsUrl,
  });

  factory Municipality.fromJson(Map<String, dynamic> json) {
    return Municipality(
      name: json['name'] ?? '',
      flagUrl: json['flag_url'] ?? '',
      coatOfArmsUrl: json['coat_of_arms_url'] ?? '',
    );
  }

  @override
  List<Object?> get props => [name, flagUrl, coatOfArmsUrl];
}
