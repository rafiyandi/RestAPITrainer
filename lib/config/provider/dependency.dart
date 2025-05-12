import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sanberapp66/datasource/profile/user_profile_datasource.dart';

class Dependency {
  static void init() {
    Get.put(Dio(), permanent: true);
    Get.lazyPut(() => UserProfileDatasource(Get.find()));
  }
}
