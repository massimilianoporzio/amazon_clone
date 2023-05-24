part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final AuthType authType;
  const AuthState({
    required this.authType,
  });

  factory AuthState.initial() => const AuthState(authType: AuthType.signUp);

  @override
  List<Object> get props => [authType];

  @override
  String toString() => 'AuthState(authType: $authType)';

  AuthState copyWith({
    AuthType? authType,
  }) {
    return AuthState(
      authType: authType ?? this.authType,
    );
  }
}
