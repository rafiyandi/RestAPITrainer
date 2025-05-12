import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sanberapp66/datasource/profile/user_profile_datasource.dart';

import '../model/user_profile_model.dart';

class UserProfileController extends GetxController {
  UserProfileController(this._datasource);
  final UserProfileDatasource _datasource;
  @override
  void onInit() {
    super.onInit();
    fetchDataUser();
  }

  List<UserProfileModel> users = [];

  Future<void> fetchDataUser() async {
    log('Dipanggil');
    users = await _datasource.fetchDataUser();
    update();
  }
}
