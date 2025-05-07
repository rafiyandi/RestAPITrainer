import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sanberapp66/config/navigation/navigation_service.dart';
import 'package:sanberapp66/config/style/app_color.dart';
import 'package:sanberapp66/datasource/auth/auth_local_datasource.dart';

class AuthDatasource {
  Dio dio = Dio();
  static const host = 'https://reqres.in/api/users';
  static const loginHost = 'https://reqres.in/api/login';
  final _auth = FirebaseAuth.instance;

  Future<String> login(
      {required String email, required String password}) async {
    try {
      final response = await dio.post(
        loginHost,
        data: {'email': email, 'password': password},
        options: Options(
          headers: {'x-api-key': 'reqres-free-v1'},
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        String token = response.data['token'];
        AuthLocalDatasource.storeData(token);
        return token;
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (credential.user != null) {
        return credential.user;
      }
      throw Exception();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
          .showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Email atau password yang anda masukkan salah',
            style: TextStyle(color: whiteColor),
          ),
        ),
      );
      // log('masuk pak ekooo ${e.code}');
      // if (e.code == 'user-not-found') {
      //   print('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   print('Wrong password provided for that user.');
      // } else if (e.code == 'invalid-credential') {
      //   print('User Not Found');
      // }
    }
  }

  Future<User?> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (credential.user != null) {
        ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
            .showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Yeay!, Berhasil Register',
              style: TextStyle(color: whiteColor),
            ),
          ),
        );
        return credential.user;
      }
      throw Exception();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
