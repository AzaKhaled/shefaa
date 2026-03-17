class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? companyId;
  final String? role;
  final String? location;
  final int? locationId;
  final List<String> permissions;

  const UserModel({
    this.id,
    this.name,
    this.email,
    this.companyId,
    this.role,
    this.location,
    this.locationId,
    this.permissions = const [],
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      companyId: json['company_id'] as String?,
      role: json['role'] as String?,
      location: json['location'] as String?,
      locationId: json['location_id'] as int?,
      permissions: const [], // هتتملّي من الـ response الأساسي
    );
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? companyId,
    String? role,
    String? location,
    int? locationId,
    List<String>? permissions,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      companyId: companyId ?? this.companyId,
      role: role ?? this.role,
      location: location ?? this.location,
      locationId: locationId ?? this.locationId,
      permissions: permissions ?? this.permissions,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'company_id': companyId,
    'role': role,
    'location': location,
    'location_id': locationId,
    'permissions': permissions,
  };
}
