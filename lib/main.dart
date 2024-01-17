import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management_new/core/dependency_injection/injectable.dart';
import 'package:hr_management_new/core/util/navigator_service/navigator_services.dart';
import 'package:hr_management_new/config/routes/app_routes.dart';
import 'package:hr_management_new/config/size_utils/size_utils.dart';
import 'package:hr_management_new/features/hr_management/application/bloc/dashBoard/dash_board_bloc.dart';
import 'package:hr_management_new/features/hr_management/application/bloc/department/department_bloc.dart';
import 'package:hr_management_new/features/hr_management/application/bloc/designation/designation_bloc.dart';
import 'package:hr_management_new/features/hr_management/application/bloc/employees/employees_bloc.dart';
import 'package:hr_management_new/features/hr_management/application/bloc/holiday/holiday_bloc.dart';
import 'package:hr_management_new/features/hr_management/application/bloc/sign_in/signin_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureInjection();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _result = MediaQuery.of(context).size;
    mHight = _result.height;
    mWidth = _result.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<SigninBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<DepartmentBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<DesignationBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<EmployeesBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HolidayBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<DashBoardBloc>(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: NavigatorService.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Hr Management',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          scaffoldBackgroundColor: const Color.fromARGB(255, 239, 239, 239),
          useMaterial3: false,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.orange),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          ),
        ),
        initialRoute: AppRoutes.splashScreen,
        routes: AppRoutes.appRoutes,
      ),
    );
  }
}
