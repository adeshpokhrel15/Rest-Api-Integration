import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restapi_flutter/architecture/core/app_error.dart';
import 'package:restapi_flutter/architecture/core/dio_exception.dart';
import 'package:restapi_flutter/architecture/features/users/data/data_sources/user_remote_data_source.dart';
import 'package:restapi_flutter/architecture/features/users/data/models/user_models.dart';

final userRepositoryProvider = Provider<UserRepository>(
    (ref) => UserRepositoryImpl(ref.read(userRemoteDataSourceProvider)));

abstract class UserRepository {
  Future<Either<AppError, UserResponseModel>> getUsers();
}

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;
  UserRepositoryImpl(this._userRemoteDataSource);
  @override
  Future<Either<AppError, UserResponseModel>> getUsers() async {
    try {
      final result = await _userRemoteDataSource.getUsers();
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(message: e.message!));
    }
  }
}
