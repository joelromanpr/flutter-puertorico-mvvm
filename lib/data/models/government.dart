import 'package:equatable/equatable.dart';

class Official extends Equatable {
  final String name;
  final String? position;
  final String? roleDescription;
  final String? party;
  final String? profilePictureUrl;
  final String? district;
  final int? appointmentYear;

  const Official({
    required this.name,
    this.position,
    this.roleDescription,
    this.party,
    this.profilePictureUrl,
    this.district,
    this.appointmentYear,
  });

  factory Official.fromJson(Map<String, dynamic> json) {
    return Official(
      name: json['name'] ?? '',
      position: json['position'],
      roleDescription: json['role_description'],
      party: json['party'],
      profilePictureUrl: json['profile_picture_url'],
      district: json['district'],
      appointmentYear: json['appointment_year'],
    );
  }

  @override
  List<Object?> get props => [
        name,
        position,
        roleDescription,
        party,
        profilePictureUrl,
        district,
        appointmentYear,
      ];
}
