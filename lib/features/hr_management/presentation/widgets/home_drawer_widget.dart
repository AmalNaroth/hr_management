import 'package:flutter/material.dart';
import 'package:hr_management_new/core/util/navigator_service/navigator_services.dart';
import 'package:hr_management_new/config/routes/app_routes.dart';
import 'package:hr_management_new/config/size_utils/size_utils.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

class DrawerCardWidget extends StatelessWidget {
  const DrawerCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  fHight20,
                  buildHeader(context, name: "Savari", email: "Tavel partner"),
                  fHight20,
                  buildMenuItem(context,
                      title: "Dashboard",
                      icon: Icons.dashboard,
                      pages: Pages.Dashboard),
                  buildMenuItem(context,
                      title: "All Employees",
                      icon: Icons.dashboard,
                      pages: Pages.AllEmployees),
                  buildMenuItem(context,
                      title: "Holydays",
                      icon: Icons.dashboard,
                      pages: Pages.Holydays),
                  // buildMenuItem(context,
                  //     title: "Leaves",
                  //     icon: Icons.dashboard,
                  //     pages: Pages.Leaves),
                  // buildMenuItem(context,
                  //     title: "Attendence",
                  //     icon: Icons.dashboard,
                  //     pages: Pages.Attendence),
                  buildMenuItem(context,
                      title: "Department",
                      icon: Icons.dashboard,
                      pages: Pages.Department),
                  buildMenuItem(context,
                      title: "Designation",
                      icon: Icons.dashboard,
                      pages: Pages.Designation),
                  fHight20,
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  fHight20,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context,
      {required String title, required IconData icon, required Pages pages}) {
    const Color color = Colors.white;
    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: CustomTextWidget01(textValue: title, fontColors: color),
        leading: Icon(icon, color: color),
        onTap: () {
          switch (pages) {
            case Pages.Dashboard:
              NavigatorService.popAndPushNamed(AppRoutes.homeScreen);
            case Pages.AllEmployees:
              NavigatorService.popAndPushNamed(AppRoutes.allEmployeesScreen);
            case Pages.Holydays:
              NavigatorService.popAndPushNamed(AppRoutes.holidayScreen);
            case Pages.Leaves:
              NavigatorService.popAndPushNamed(AppRoutes.employeesLeave);
            case Pages.Attendence:
              NavigatorService.popAndPushNamed(
                  AppRoutes.employeesAttendanceScreen);
            case Pages.Department:
              NavigatorService.popAndPushNamed(AppRoutes.departmentScreen);
            case Pages.Designation:
              NavigatorService.popAndPushNamed(AppRoutes.designationScreen);
          }
        },
      ),
    );
  }

  Widget buildHeader(
    BuildContext context, {
    required String name,
    required String email,
  }) =>
      Material(
        color: Colors.transparent,
        child: InkWell(
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage("https://images.unsplash.com/photo-1503220317375-aaad61436b1b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Row(
                    children: [
                       Text(
                        email,
                        style: const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                    ),
                  ],
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                  child: Icon(Icons.add_comment_outlined, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      );
}

enum Pages {
  Dashboard,
  AllEmployees,
  Holydays,
  Leaves,
  Attendence,
  Department,
  Designation
}
