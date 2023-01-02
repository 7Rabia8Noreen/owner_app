// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:owner_app/pages/home_page.dart';
import '../errors/exceptions.dart';
import '../networks/network_client.dart';
import '../pages/login_page.dart';

class VerificationProvider with ChangeNotifier {

  NetworkClient networkClient = NetworkClient();

  Future<void> submitVerifyEmail(final token,
      BuildContext context) async {
    try {

 void callLogin()
{
   Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LoginPage()         
          ),
        );
}
      final result = await networkClient.post(
          '/email/verification-notification',
          {
            
          },
          token: token );
          Logger().i(result.toString());
          Map<String, dynamic> map = jsonDecode(result.toString());
           if (map['status']=='verification-link-send'){
              
           final box = GetStorage();
            box.write('isLoading', false);
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Check your email to verify'), backgroundColor: Colors.green));
           Timer(Duration(milliseconds: 2000),callLogin
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
