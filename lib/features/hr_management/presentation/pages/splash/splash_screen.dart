import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hr_management_new/core/util/navigator_service/navigator_services.dart';
import 'package:hr_management_new/config/routes/app_routes.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () {
        if (FirebaseAuth.instance.currentUser != null) {
          NavigatorService.pushReplacementNamed(AppRoutes.homeScreen);
        } else {
          NavigatorService.pushReplacementNamed(AppRoutes.signInScreen);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CustomTextWidget01(
            textValue: "S A V A R I",
            fontColors: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30),
      ),
    );
  }
}
