import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanberapp66/config/style/app_color.dart';
import 'package:sanberapp66/pages/auth/login/login_page.dart';
import 'package:sanberapp66/pages/profile/user_profile_page.dart';

import '../../../config/custom/button/custom_primary_button.dart';
import '../../../config/custom/image/custom_box_image_asset.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

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
                onPressed: () {},
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
