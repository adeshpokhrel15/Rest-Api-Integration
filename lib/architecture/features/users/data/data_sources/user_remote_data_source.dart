import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restapi_flutter/architecture/features/users/data/models/user_models.dart';

import '../../../../constants/api_constants.dart';
import '../../../../core/api_service.dart';

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>(
    (ref) => UserRemoteDataSourceImpl(ref.read(apiServiceprovider)));

abstract class UserRemoteDataSource {
  Future<UserResponseModel> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiService _apiService;
  UserRemoteDataSourceImpl(this._apiService);
  @override
  Future<UserResponseModel> getUsers() async {
    final result = await ApiService().getData(ednpoint: ApiConstant.users);
    return UserResponseModel.fromMap(result);
  }
}
