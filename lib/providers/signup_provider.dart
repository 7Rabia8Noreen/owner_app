// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:owner_app/pages/login_page.dart';
import 'package:owner_app/providers/verification_provider.dart';
import 'package:provider/provider.dart';


import '../errors/exceptions.dart';

import '../networks/network_client.dart';

class SignupProvider with ChangeNotifier {
  NetworkClient networkClient = NetworkClient();

  Future<void> submitSignupForm(
      final emailController,
      final nameController,
      final passwordController,

      BuildContext context) async {
    try {
      final res = await networkClient.post('/register', {
        'email': emailController.text,
        'name': nameController.text.trim(),
        'password': passwordController.text.trim(),

      });
      Logger().i(res.toString());
      Map<String, dynamic> mp = jsonDecode(res.toString());
      if (mp['code']==200) {
        emailController.clear();
        nameController.clear();
        passwordController.clear();
  
        Logger().i(mp['accessToken']);

        final token=mp['accessToken'];

        Provider.of<VerificationProvider>(context, listen: false).submitVerifyEmail(
       token,
        context);      
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
