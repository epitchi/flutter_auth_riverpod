class UserRequest {
  UserRequest({
    required this.identity,
    required this.password,
  });

  String identity;
  String password;

  factory UserRequest.fromJson(Map<String, dynamic> json) => UserRequest(
        identity: json["identity"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "identity": identity,
        "password": password,
      };
}
