import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanberapp66/config/custom/image/custom_box_image_network.dart';
import 'package:sanberapp66/config/style/app_color.dart';
import 'package:sanberapp66/controller/user_profile_controller.dart';
import 'package:sanberapp66/datasource/auth/auth_local_datasource.dart';
import 'package:sanberapp66/datasource/profile/user_profile_datasource.dart';
import 'package:sanberapp66/model/user_profile_model.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userC = Get.put(UserProfileController());
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
        init: userC,
        builder: (_) => ListView.separated(
          separatorBuilder: (context, index) =>
              Padding(padding: EdgeInsets.all(20)),
          itemCount: userC.users.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
                '${userC.users[index].firstName} ${userC.users[index].firstName}'),
            leading: CustomBoxImageNetwork(
                shape: BoxShape.circle,
                height: 80,
                width: 80,
                urlImage: userC.users[index].avatar),
            subtitle: Text(userC.users[index].email),
          ),
        ),
      ),
    );
  }
}
