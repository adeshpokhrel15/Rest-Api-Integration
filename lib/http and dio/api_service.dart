import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/user_mode.dart';

final userProvider = FutureProvider<List<UserModel>>((ref) async {
  return ApiData().getallData();
});

// Using http package
// class ApiService {
//   Future<List<UserModel>> getData() async {
//     const usersUrl = "https://reqres.in/api/users";

//     try {
//       final response = await http.get(Uri.parse(usersUrl));
//       final responseData = json.decode(response.body);
//       final userList = responseData['data'] as List;

//       return userList.map((e) => UserModel.fromJson(e)).toList();
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }

//using dio package
class ApiData {
  Future<List<UserModel>> getallData() async {
    final dio = Dio();
    try {
      final response = await dio.get("https://reqres.in/api/users");
      final responseData = response.data;
      final userList = (responseData['data'] as List).map((e) {
        return UserModel.fromJson(e);
      }).toList();
      return userList;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
