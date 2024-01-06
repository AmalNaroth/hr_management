import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hr_management_new/core/util/navigator_service/navigator_services.dart';
import 'package:hr_management_new/core/util/routes/app_routes.dart';
import 'package:hr_management_new/features/hr_management/presentation/widgets/home_drawer_widget.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              NavigatorService.pushNamedAndRemoveUntil(AppRoutes.signInScreen);
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [],
      ),
      drawer: DrawerCardWidget(),
    );
  }
}
