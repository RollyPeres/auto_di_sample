part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable {
  AuthState(this.userId);
  factory AuthState.initial() => AuthState('');

  final String userId;

  @override
  List<Object> get props => [userId];
}
