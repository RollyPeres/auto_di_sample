import 'user_repository.dart';

class LiveUserRepository implements UserRepository {
  @override
  Future<void> authenticate() async {
    return;
  }

  @override
  Future<String> getUserId() async {
    return 'prod user';
  }

  @override
  Future<bool> isAuthenticated() async {
    return true;
  }
}
