import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sanberapp66/config/provider/endpoint.dart';
import 'package:sanberapp66/model/user_profile_model.dart';

class UserProfileDatasource {
  final Dio dio;
  UserProfileDatasource(this.dio);
  Future<List<UserProfileModel>> fetchDataUser() async {
    try {
      final response = await dio.get('${Endpoint.host}/${Endpoint.user}',
          options: Options(headers: {'x-api-key': 'reqres-free-v1'}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'];
        List<UserProfileModel> users = List<UserProfileModel>.from(
            data.map((element) => UserProfileModel.fromJson(element)));

        // List<UserProfileModel> users = [];
        // for (var element in data) {
        //   users.add(UserProfileModel.fromJson(element));
        // }
        return users;
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }
}
