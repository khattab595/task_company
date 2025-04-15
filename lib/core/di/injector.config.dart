// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../../src/auth/data/data_sources/auth_datasource.dart' as _i3;
import '../../src/auth/data/repositories/auth_repo_imp.dart' as _i6;
import '../../src/auth/domain/repositories/auth_repo.dart' as _i5;
import '../../src/auth/presentation/bloc/auth_bloc.dart' as _i15;
import '../../src/cart/presentation/cart/cubit/cart_bloc.dart' as _i7;
import '../../src/product/data/data_sources/home_datasource.dart' as _i9;
import '../../src/product/data/repositories/home_repo_imp.dart' as _i17;
import '../../src/product/domain/repositories/home_repo.dart' as _i16;
import '../../src/product/presentation/bloc/home_bloc.dart' as _i18;
import '../../src/settings/data/data_sources/settings_datasource.dart' as _i10;
import '../../src/settings/data/repositories/settings_repo_imp.dart' as _i12;
import '../../src/settings/domain/repositories/settings_repo.dart' as _i11;
import '../../src/settings/presentation/bloc/about_logeste_bloc.dart' as _i14;
import '../../src/settings/presentation/bloc/language_bloc.dart' as _i8;
import 'injection_module.dart' as _i19;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectionModule = _$InjectionModule();
  gh.factory<_i3.AuthDataSource>(() => _i3.AuthDataSource(gh<_i4.Dio>()));
  gh.factory<_i5.AuthRepo>(() => _i6.AuthRepoImp(gh<_i3.AuthDataSource>()));
  gh.factory<_i7.CartCubit>(() => _i7.CartCubit());
  gh.factory<_i8.LanguageCubit>(() => _i8.LanguageCubit());
  gh.factory<_i9.ProductDatasource>(() => _i9.ProductDatasource());
  gh.factory<_i10.SettingsDatasource>(
      () => _i10.SettingsDatasource(gh<_i4.Dio>()));
  gh.factory<_i11.SettingsRepo>(
      () => _i12.SettingsRepoImp(gh<_i10.SettingsDatasource>()));
  await gh.factoryAsync<_i13.SharedPreferences>(
    () => injectionModule.prefs,
    preResolve: true,
  );
  gh.factory<_i14.AboutLogesteCubit>(
      () => _i14.AboutLogesteCubit(gh<_i11.SettingsRepo>()));
  gh.factory<_i15.AuthCubit>(() => _i15.AuthCubit(gh<_i5.AuthRepo>()));
  gh.factory<_i16.HomeRepo>(
      () => _i17.HomeRepoImp(gh<_i9.ProductDatasource>()));
  gh.factory<_i18.HomeCubit>(() => _i18.HomeCubit(gh<_i16.HomeRepo>()));
  return getIt;
}

class _$InjectionModule extends _i19.InjectionModule {}
