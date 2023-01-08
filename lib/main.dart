import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_app/pages/login_page.dart';
import 'package:owner_app/providers/login_provider.dart';
import 'package:owner_app/providers/orders_history_provider.dart';
import 'package:owner_app/providers/our_specialist_provider.dart';
import 'package:owner_app/providers/signup_provider.dart';
import 'package:owner_app/providers/verification_provider.dart';
import 'package:owner_app/providers/verify_email_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => SignupProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => LoginProvider(),
          ),
           ChangeNotifierProvider(
            create: (_) => VerificationProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => OurSpecialistProvider(),
          ),
           ChangeNotifierProvider(
            create: (_) => OrdersHistoryProvider(),
          ),
           ChangeNotifierProvider(
            create: (_) => VerifyEmailProvider(),
          ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          
          primarySwatch: Colors.blue,
        ),
        home: LoginPage()
      ),
    );
  }
}

