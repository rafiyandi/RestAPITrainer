import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sanberapp66/config/custom/button/custom_primary_button.dart';
import 'package:sanberapp66/datasource/auth/auth_datasource.dart';
import 'package:sanberapp66/pages/profile/user_profile_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  label: Text('Email'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  label: Text('Password'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 50),
              CustomPrimaryButton(
                title: 'Masuk',
                onPressed: () {
                  AuthDatasource()
                      .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text)
                      .then((value) {
                    if (value != null) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserProfilePage(),
                          ),
                          (route) => false);
                    }
                  });
                  // AuthDatasource()
                  //     .login(
                  //         email: emailController.text,
                  //         password: passwordController.text)
                  //     .then((value) {
                  //   if (value != null) {
                  //     log('Ini Token ${value}');
                  //     Navigator.pushAndRemoveUntil(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const UserProfilePage(),
                  //         ),
                  //         (route) => false);
                  //   }
                  // });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
