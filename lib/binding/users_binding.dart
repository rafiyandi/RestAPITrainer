import 'package:get/get.dart';
import 'package:sanberapp66/controller/user_profile_controller.dart';
import 'package:sanberapp66/datasource/profile/user_profile_datasource.dart';

class UsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserProfileController(Get.find<UserProfileDatasource>()));
  }
}
