import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info/package_info.dart';
import 'package:user_repository/user_repository.dart';
import 'locator.iconfig.dart';

final GetIt locator = GetIt.instance;

@injectableInit
Future<void> bootstrapLocator([String environment]) {
  return $initGetIt(locator, environment: environment);
}

@registerModule
abstract class RepositoryModule {
  @prod
  @lazySingleton
  UserRepository get liveUserRepository => LiveUserRepository();

  @dev
  @lazySingleton
  UserRepository get fakeUserRepository => FakeUserRepository();
}

@registerModule
abstract class PackageModule {
  // this will execute the future upon registration and register the actual returned value into container
  // this will allow for sync access to it throughout the app
  @preResolve
  @singleton
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();
}
