
class Official {
  final String name;
  final String? position;
  final String? roleDescription;
  final String? party;
  final String? profilePictureUrl;
  final String? district;
  final int? appointmentYear;

  Official({
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
}
