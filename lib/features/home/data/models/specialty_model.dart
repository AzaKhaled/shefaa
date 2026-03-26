class SpecialtyModel {
  final int id;
  final String name;
  final String icon;

  SpecialtyModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory SpecialtyModel.fromJson(Map<String, dynamic> json) {
    return SpecialtyModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
    );
  }
}

class SpecialtiesResponse {
  final String status;
  final List<SpecialtyModel> data;

  SpecialtiesResponse({
    required this.status,
    required this.data,
  });

  factory SpecialtiesResponse.fromJson(Map<String, dynamic> json) {
    return SpecialtiesResponse(
      status: json['status'],
      data: (json['data'] as List).map((i) => SpecialtyModel.fromJson(i)).toList(),
    );
  }
}
