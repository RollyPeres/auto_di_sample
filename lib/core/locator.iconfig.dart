// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:package_info/package_info.dart';
import 'package:auto_di_sample/core/locator.dart';
import 'package:user_repository/user_repository.dart';
import 'package:auto_di_sample/auth/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final packageModule = _$PackageModule();
  final repositoryModule = _$RepositoryModule();
  g.registerFactory<AuthBloc>(
      () => AuthBloc(userRepository: g<UserRepository>()));

  //Register prod Dependencies --------
  if (environment == 'prod') {
    g.registerLazySingleton<UserRepository>(
        () => repositoryModule.liveUserRepository);
  }

  //Register dev Dependencies --------
  if (environment == 'dev') {
    g.registerLazySingleton<UserRepository>(
        () => repositoryModule.fakeUserRepository);
  }

  //Eager singletons must be registered in the right order
  final packageInfo = await packageModule.packageInfo;
  g.registerSingleton<PackageInfo>(packageInfo);
}

class _$PackageModule extends PackageModule {}

class _$RepositoryModule extends RepositoryModule {}
