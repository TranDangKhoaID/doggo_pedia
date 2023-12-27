// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../../data/network/core_rest_service.dart' as _i5;
import '../../data/network/dio/dio_factory.dart' as _i7;
import '../../data/repository/breeds_repository.dart' as _i6;
import 'get_it.dart' as _i8;

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
  final dioFactory = _$DioFactory();
  final utilInjectableModule = _$UtilInjectableModule();
  gh.factory<_i3.Dio>(() => dioFactory.dio);
  await gh.factoryAsync<_i4.SharedPreferences>(
    () => utilInjectableModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i5.CoreRestService>(
      () => _i5.CoreRestService(gh<_i3.Dio>()));
  gh.lazySingleton<_i6.BreedRepository>(
      () => _i6.BreedsRepositoryImpl(gh<_i5.CoreRestService>()));
  return getIt;
}

class _$DioFactory extends _i7.DioFactory {}

class _$UtilInjectableModule extends _i8.UtilInjectableModule {}
