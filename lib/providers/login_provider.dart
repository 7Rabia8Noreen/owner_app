// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:owner_app/pages/home_page.dart';
import '../errors/exceptions.dart';
import '../networks/network_client.dart';

class LoginProvider with ChangeNotifier {

  NetworkClient networkClient = NetworkClient();

  Future<void> submitLoginForm(final emailController, final passwordController,
      BuildContext context) async {
    try {
      final res = await networkClient.post('/login', {
        'email': emailController.text,
        'password': passwordController.text.trim(),
      });
      Logger().i(res.toString());
      Map<String, dynamic> mp = jsonDecode(res.toString());
     if (mp['code']==200){
        emailController.clear();
        passwordController.clear();
         Logger().i(mp['success']['token']);
         Logger().i(mp['success']['id']);
         Logger().i(mp['success']['name']);
         Logger().i(mp['success']['email']);
         final int id= mp['success']['id'];
         final String name=mp['success']['name'];
         final String email= mp['success']['email'];
         final String token=mp['success']['token'];
         final box = GetStorage();
            box.write('isLoading', false);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('logged in successfully'), backgroundColor: Colors.green));

       Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
             HomePage(
              id: id,
              name: name,
              email: email,
              token: token,
             )         
          ),
        );
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Something went wrong try again'), backgroundColor: Colors.red));
      }
    } on RemoteException catch (e) {
      Logger().e(e.dioError);
    }
    //return mp['success'];
  }
}
