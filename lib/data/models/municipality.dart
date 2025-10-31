
class Municipality {
  final String name;
  final String? flag;

  Municipality({required this.name, this.flag});

  factory Municipality.fromJson(Map<String, dynamic> json) {
    return Municipality(
      name: json['name'] ?? '',
      flag: json['flag'],
    );
  }
}
