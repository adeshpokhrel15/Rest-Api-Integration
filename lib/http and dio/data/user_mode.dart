// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData['id'],
      email: jsonData['email'],
      firstName: jsonData['first_name'],
      lastName: jsonData['last_name'],
      avatar: jsonData['avatar'],
    );
  }
}
