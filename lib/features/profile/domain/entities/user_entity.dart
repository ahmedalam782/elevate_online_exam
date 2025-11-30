class UserEntity {
  final String userName;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  UserEntity({
    required this.userName,
    required this.email,
    required this.phone,
    required this.firstName,
    required this.lastName,
  });

  UserEntity copyWith({
    String? userName,
    String? email,
    String? phone,
    String? firstName,
    String? lastName,
  }) {
    return UserEntity(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }
}
