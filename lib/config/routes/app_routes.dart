import 'package:flutter/material.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/Attendence/employees_attendence_screen.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/Department/department_screen.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/Designations/designation_screen.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/all_employees/add_employees_screen.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/all_employees/all_employees_screen.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/employees_leave/employees_leave_screen.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/holidays/holiday_screen.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/authentication/sigin_in_screen.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/dashboard/dashboard.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/splash/splash_screen.dart';

class AppRoutes {
  static const String allEmployeesScreen = "All-Employees-Screen";
  static const String departmentScreen = "Department-Screen";
  static const String designationScreen = "Designation-Screen";
  static const String employeesAttendanceScreen = "Employees-Attendence-Screen";
  static const String employeesLeave = 'Employees-Leave';
  static const String holidayScreen = 'Holiday-Screen';
  static const String homeScreen = "Home-Screen";
  static const String newEmployeeAddScreen = "New-Employee-Add-Screen";
  static const String signInScreen = "Sign-In-Screen";
  static const String signUpScreen = "Sign-Up-Screen";
  static const String splashScreen = "Splash-Screen";

  static Map<String, WidgetBuilder> get appRoutes => {
        AppRoutes.signInScreen: (context) => SignInScreen(),
        AppRoutes.splashScreen: (context) => const SplashScreen(),
        AppRoutes.homeScreen: (context) => const DashBoardScreen(),
        AppRoutes.allEmployeesScreen: (context) => AllEmployeesScreen(),
        AppRoutes.holidayScreen: (context) => const HolidayScreen(),
        AppRoutes.employeesLeave: (context) => EmployeesLeaveScreen(),
        AppRoutes.employeesAttendanceScreen: (context) =>
            EmployeesAttendenceScreen(),
        AppRoutes.departmentScreen: (context) => DepartmentScreen(),
        AppRoutes.designationScreen: (context) => DesignationScreen(),
      };
}