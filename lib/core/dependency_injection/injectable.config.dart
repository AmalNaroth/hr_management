// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/hr_management/application/bloc/sign_in/signin_bloc.dart'
    as _i5;
import '../../features/hr_management/domain/sign_in/sign_in_services.dart'
    as _i3;
import '../../features/hr_management/infrastructure/authentication/sing_in/sing_in_repository.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.SignInServices>(() => _i4.SignInRepository());
  gh.factory<_i5.SigninBloc>(() => _i5.SigninBloc(get<_i3.SignInServices>()));
  return get;
}
