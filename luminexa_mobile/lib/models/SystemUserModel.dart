class SystemUser {
  final String id;
  final String name;
  final String email;
  bool isHost;

  SystemUser({
    required this.id,
    required this.name,
    required this.email,
    required this.isHost,
  });

  static SystemUser fromJSON(Map json) {
    final SystemUser newSystemUser = SystemUser(
      id: json['_id'],
      name: json["userName"],
      email: json["email"],
      isHost: json["isHosts"],
    );

    return newSystemUser;
  }
}
