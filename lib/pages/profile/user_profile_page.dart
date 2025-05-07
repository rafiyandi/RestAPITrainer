import 'package:flutter/material.dart';
import 'package:sanberapp66/config/custom/image/custom_box_image_network.dart';
import 'package:sanberapp66/config/style/app_color.dart';
import 'package:sanberapp66/datasource/auth/auth_local_datasource.dart';
import 'package:sanberapp66/datasource/profile/user_profile_datasource.dart';
import 'package:sanberapp66/model/user_profile_model.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  List<UserProfileModel> users = [];
  bool isLoading = false;
  @override
  void initState() {
    //Merupakan method pertama di panggil ketika masuk ke page ini
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    isLoading = true;
    users = await UserProfileDatasource().fetchDataUser();
    isLoading = false;
    setState(() {});
    print('Data ${users.length}');
  }

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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              separatorBuilder: (context, index) =>
                  Padding(padding: EdgeInsets.all(20)),
              itemCount: users.length,
              itemBuilder: (context, index) => ListTile(
                title:
                    Text('${users[index].firstName} ${users[index].firstName}'),
                leading: CustomBoxImageNetwork(
                    shape: BoxShape.circle,
                    height: 80,
                    width: 80,
                    urlImage: users[index].avatar),
                subtitle: Text(users[index].email),
              ),
            ),
    );
  }
}
