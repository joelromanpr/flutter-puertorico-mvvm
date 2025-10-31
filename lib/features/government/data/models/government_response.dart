
import 'package:flutter_puertorico_mvvm/features/government/data/models/government.dart';

class GovernmentResponse {
  final GovernmentBranch executiveBranch;
  final GovernmentBranch legislativeBranch;
  final GovernmentBranch judicialBranch;
  final GovernmentBranch federalRepresentation;

  GovernmentResponse({
    required this.executiveBranch,
    required this.legislativeBranch,
    required this.judicialBranch,
    required this.federalRepresentation,
  });

  factory GovernmentResponse.fromJson(Map<String, dynamic> json) {
    return GovernmentResponse(
      executiveBranch: GovernmentBranch.fromJson(json['executive_branch'] ?? {}),
      legislativeBranch: GovernmentBranch.fromJson(json['legislative_branch'] ?? {}),
      judicialBranch: GovernmentBranch.fromJson(json['judicial_branch'] ?? {}),
      federalRepresentation:
          GovernmentBranch.fromJson(json['federal_representation'] ?? {}),
    );
  }
}

class GovernmentBranch {
  final String name;
  final String description;
  final Official? governor;
  final List<Official> cabinet;
  final Senate? senate;
  final HouseOfRepresentatives? houseOfRepresentatives;
  final SupremeCourt? supremeCourt;
  final Official? residentCommissioner;

  GovernmentBranch({
    required this.name,
    required this.description,
    this.governor,
    this.cabinet = const [],
    this.senate,
    this.houseOfRepresentatives,
    this.supremeCourt,
    this.residentCommissioner,
  });

  factory GovernmentBranch.fromJson(Map<String, dynamic> json) {
    return GovernmentBranch(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      governor: json['governor'] != null ? Official.fromJson(json['governor']) : null,
      cabinet: (json['cabinet'] as List?)
              ?.map((i) => Official.fromJson(i))
              .toList() ??
          [],
      senate: json['senate'] != null ? Senate.fromJson(json['senate']) : null,
      houseOfRepresentatives: json['house_of_representatives'] != null
          ? HouseOfRepresentatives.fromJson(json['house_of_representatives'])
          : null,
      supremeCourt: json['supreme_court'] != null
          ? SupremeCourt.fromJson(json['supreme_court'])
          : null,
      residentCommissioner: json['resident_commissioner'] != null
          ? Official.fromJson(json['resident_commissioner'])
          : null,
    );
  }
}

class Senate {
  final String name;
  final String description;
  final List<Official> leadership;
  final List<Official> senators;

  Senate({
    required this.name,
    required this.description,
    required this.leadership,
    required this.senators,
  });

  factory Senate.fromJson(Map<String, dynamic> json) {
    return Senate(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      leadership: (json['leadership'] as List?)
              ?.map((i) => Official.fromJson(i))
              .toList() ??
          [],
      senators: (json['senators'] as List?)
              ?.map((i) => Official.fromJson(i))
              .toList() ??
          [],
    );
  }
}

class HouseOfRepresentatives {
  final String name;
  final String description;
  final List<Official> leadership;
  final List<Official> representatives;

  HouseOfRepresentatives({
    required this.name,
    required this.description,
    required this.leadership,
    required this.representatives,
  });

  factory HouseOfRepresentatives.fromJson(Map<String, dynamic> json) {
    return HouseOfRepresentatives(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      leadership: (json['leadership'] as List?)
              ?.map((i) => Official.fromJson(i))
              .toList() ??
          [],
      representatives: (json['representatives'] as List?)
              ?.map((i) => Official.fromJson(i))
              .toList() ??
          [],
    );
  }
}

class SupremeCourt {
  final String name;
  final String description;
  final Official chiefJustice;
  final List<Official> associateJustices;

  SupremeCourt({
    required this.name,
    required this.description,
    required this.chiefJustice,
    required this.associateJustices,
  });

  factory SupremeCourt.fromJson(Map<String, dynamic> json) {
    return SupremeCourt(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      chiefJustice: Official.fromJson(json['chief_justice'] ?? {}),
      associateJustices: (json['associate_justices'] as List?)
              ?.map((i) => Official.fromJson(i))
              .toList() ??
          [],
    );
  }
}
