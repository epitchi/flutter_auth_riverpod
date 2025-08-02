// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

class UserResponse {
  UserResponse({
    required this.jwt,
    required this.user,
  });

  String jwt;
  UserModel user;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        jwt: json["token"],
        user: UserModel.fromJson(json["record"]),
      );

  Map<String, dynamic> toJson() => {
        "jwt": jwt,
        "user": user.toJson(),
      };
}

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.avatar,
    required this.verified,
    required this.createdAt,
    required this.updatedAt,
    required this.metadata,
  });

  String id;
  String name;
  String username;
  String email;
  String avatar;
  bool verified;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic metadata;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        avatar: json["avatar"],
        verified: json["verified"] == "true" ? true: false,
        createdAt: DateTime.parse(json["created"]),
        updatedAt: DateTime.parse(json["updated"]),
        metadata: json['metadata'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "avatar": avatar,
        "verified": verified,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "metadata": metadata,
      };
}
