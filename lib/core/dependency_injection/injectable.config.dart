// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/hr_management/application/bloc/department/department_bloc.dart'
    as _i14;
import '../../features/hr_management/application/bloc/designation/designation_bloc.dart'
    as _i15;
import '../../features/hr_management/application/bloc/employees/employees_bloc.dart'
    as _i16;
import '../../features/hr_management/application/bloc/holiday/holiday_bloc.dart'
    as _i17;
import '../../features/hr_management/application/bloc/sign_in/signin_bloc.dart'
    as _i13;
import '../../features/hr_management/domain/employees/all_employees/new_employee_services.dart'
    as _i9;
import '../../features/hr_management/domain/employees/department/department_services.dart'
    as _i3;
import '../../features/hr_management/domain/employees/designation/designation_services.dart'
    as _i5;
import '../../features/hr_management/domain/employees/holiday/holiday_services.dart'
    as _i7;
import '../../features/hr_management/domain/sign_in/sign_in_services.dart'
    as _i11;
import '../../features/hr_management/infrastructure/authentication/sing_in/sing_in_repository.dart'
    as _i12;
import '../../features/hr_management/infrastructure/employees/add_new_employee/add_new_employee_repository.dart'
    as _i10;
import '../../features/hr_management/infrastructure/employees/department/add_department_repository.dart'
    as _i4;
import '../../features/hr_management/infrastructure/employees/designation/designation_repository.dart'
    as _i6;
import '../../features/hr_management/infrastructure/employees/holiday/holiday_repository.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i7.HolidayServices>(() => _i8.HolidayRepository());
  gh.lazySingleton<_i9.NewEmployeeAddServices>(
      () => _i10.NewEmployeeAddRepository());
  gh.lazySingleton<_i11.SignInServices>(() => _i12.SignInRepository());
  gh.factory<_i13.SigninBloc>(
      () => _i13.SigninBloc(get<_i11.SignInServices>()));
  gh.factory<_i14.DepartmentBloc>(
      () => _i14.DepartmentBloc(get<_i3.DepartmentServices>()));
  gh.factory<_i15.DesignationBloc>(() => _i15.DesignationBloc(
        get<_i5.DesignationService>(),
        get<_i3.DepartmentServices>(),
      ));
  gh.factory<_i16.EmployeesBloc>(() => _i16.EmployeesBloc(
        get<_i5.DesignationService>(),
        get<_i9.NewEmployeeAddServices>(),
      ));
  gh.factory<_i17.HolidayBloc>(
      () => _i17.HolidayBloc(get<_i7.HolidayServices>()));
  return get;
}
