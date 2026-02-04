sealed class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  final String username;
  Authenticated(this.username);
}
