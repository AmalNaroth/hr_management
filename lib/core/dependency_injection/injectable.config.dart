// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/hr_management/application/bloc/department/department_bloc.dart'
    as _i12;
import '../../features/hr_management/application/bloc/designation/designation_bloc.dart'
    as _i13;
import '../../features/hr_management/application/bloc/employees/employees_bloc.dart'
    as _i14;
import '../../features/hr_management/application/bloc/sign_in/signin_bloc.dart'
    as _i11;
import '../../features/hr_management/domain/employees/all_employees/new_employee_services.dart'
    as _i7;
import '../../features/hr_management/domain/employees/department/department_services.dart'
    as _i3;
import '../../features/hr_management/domain/employees/designation/designation_services.dart'
    as _i5;
import '../../features/hr_management/domain/sign_in/sign_in_services.dart'
    as _i9;
import '../../features/hr_management/infrastructure/authentication/sing_in/sing_in_repository.dart'
    as _i10;
import '../../features/hr_management/infrastructure/employees/add_new_employee/add_new_employee_repository.dart'
    as _i8;
import '../../features/hr_management/infrastructure/employees/department/add_department_repository.dart'
    as _i4;
import '../../features/hr_management/infrastructure/employees/designation/designation_repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.DepartmentServices>(() => _i4.DepartmentRepository());
  gh.lazySingleton<_i5.DesignationService>(() => _i6.DesignationRepository());
  gh.lazySingleton<_i7.NewEmployeeAddServices>(
      () => _i8.NewEmployeeAddRepository());
  gh.lazySingleton<_i9.SignInServices>(() => _i10.SignInRepository());
  gh.factory<_i11.SigninBloc>(() => _i11.SigninBloc(get<_i9.SignInServices>()));
  gh.factory<_i12.DepartmentBloc>(
      () => _i12.DepartmentBloc(get<_i3.DepartmentServices>()));
  gh.factory<_i13.DesignationBloc>(() => _i13.DesignationBloc(
        get<_i5.DesignationService>(),
        get<_i3.DepartmentServices>(),
      ));
  gh.factory<_i14.EmployeesBloc>(() => _i14.EmployeesBloc(
        get<_i5.DesignationService>(),
        get<_i7.NewEmployeeAddServices>(),
      ));
  return get;
}
