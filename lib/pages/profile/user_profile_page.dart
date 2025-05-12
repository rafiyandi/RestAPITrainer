import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanberapp66/config/custom/image/custom_box_image_network.dart';
import 'package:sanberapp66/config/style/app_color.dart';
import 'package:sanberapp66/controller/user_profile_controller.dart';
import 'package:sanberapp66/datasource/auth/auth_local_datasource.dart';
import 'package:sanberapp66/datasource/profile/user_profile_datasource.dart';
import 'package:sanberapp66/model/user_profile_model.dart';

class UserProfilePage extends GetView<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              AuthLocalDatasource.removeData();
            },
            icon: Icon(
              Icons.login,
              color: whiteColor,
            ),
          )
        ],
        title: Text('User Page'),
      ),
      body: GetBuilder(
        init: controller,
        builder: (_) => ListView.separated(
          separatorBuilder: (context, index) =>
              Padding(padding: EdgeInsets.all(20)),
          itemCount: controller.users.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
                '${controller.users[index].firstName} ${controller.users[index].firstName}'),
            leading: CustomBoxImageNetwork(
                shape: BoxShape.circle,
                height: 80,
                width: 80,
                urlImage: controller.users[index].avatar),
            subtitle: Text(controller.users[index].email),
          ),
        ),
      ),
    );
  }
}
