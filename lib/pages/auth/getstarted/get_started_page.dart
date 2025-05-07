import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanberapp66/config/style/app_color.dart';
import 'package:sanberapp66/datasource/auth/auth_local_datasource.dart';
import 'package:sanberapp66/pages/auth/login/login_page.dart';
import 'package:sanberapp66/pages/auth/register/register_page.dart';
import 'package:sanberapp66/pages/profile/user_profile_page.dart';

import '../../../config/custom/button/custom_primary_button.dart';
import '../../../config/custom/image/custom_box_image_asset.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    validateToken();
  }

  validateToken() async {
    String token = await AuthLocalDatasource.getData();
    if (token != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => UserProfilePage(),
          ),
          (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              CustomBoxImageAsset(
                margin: EdgeInsets.only(top: 86),
                urlImage: 'assets/image/image_news.png',
                height: 330,
                width: double.infinity,
              ),
              SizedBox(height: 37),
              Text(
                'Yuk, Membaca Bersama\nSanber News',
                style: GoogleFonts.arimo(
                    color: blackColor,
                    fontSize: 21,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 21),
              Text(
                'Berita Terpercaya, Di Ujung Jari Anda',
                style: GoogleFonts.arimo(
                  color: blackColor,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              CustomPrimaryButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                title: 'Masuk',
              ),
              SizedBox(height: 21),
              CustomPrimaryButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ));
                },
                title: 'Daftar',
                side: BorderSide(color: primaryColor),
                color: whiteColor,
                textColor: primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
