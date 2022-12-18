import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restapi_flutter/architecture/constants/api_constants.dart';
import 'package:restapi_flutter/architecture/core/dio_exception.dart';

final apiServiceprovider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  getData({required String ednpoint}) async {
    final dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));

    try {
      final result = await dio.get(ednpoint);
      return result.data;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
}
