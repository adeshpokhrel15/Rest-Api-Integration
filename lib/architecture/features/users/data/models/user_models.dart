// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:restapi_flutter/architecture/constants/app_constants.dart';

class UserResponseModel {
  final int page;
  final int totalPages;
  final List<ResponseModel> data;
  UserResponseModel({
    required this.page,
    required this.totalPages,
    required this.data,
  });

  factory UserResponseModel.fromMap(Map<String, dynamic> map) {
    return UserResponseModel(
        page: map['page'] as int,
        totalPages: map['totalPages'] as int,
        data: List<ResponseModel>.from(
            map['data'].map((x) => ResponseModel.fromMap(x)).toList()));
  }
}

class ResponseModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;
  ResponseModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar,
  });

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
        id: map['id'] ?? 0,
        firstName: map['first_name'] ?? '',
        lastName: map['last_name'] ?? '',
        email: map['email'] ?? '',
        avatar: map['avatar'] ?? AppConstant.placeholder);
  }
}
