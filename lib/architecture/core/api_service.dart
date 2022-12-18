import 'package:dio/dio.dart';
import 'package:restapi_flutter/architecture/constants/api_constants.dart';

class ApiService {
  getData({required String ednpoint}) async {
    final dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));

    try {
      final result = await dio.get(ednpoint);
      return result.data;
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
