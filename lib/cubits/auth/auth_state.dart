part of 'auth_cubit.dart';

enum AuthStatus {
  unAuthenticated,
  loading,
  failure,
  authenticated,
}

final authStatusValues = EnumValues({
  "unAuthenticated": AuthStatus.unAuthenticated,
  "loading": AuthStatus.loading,
  "failure": AuthStatus.failure,
  "authenticated": AuthStatus.authenticated,
});

class AuthState {
  final AuthStatus authStatus;
  final String message;
  final String email;

  AuthState({
    required this.authStatus,
    required this.message,
    required this.email,
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    String? message,
    String? email,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      message: message ?? this.message,
      email: email ?? this.email,
    );
  }

  factory AuthState.initial() {
    return AuthState(
      authStatus: AuthStatus.unAuthenticated,
      message: '',
      email: '',
    );
  }

  @override
  String toString() =>
      'AuthState(authStatus: $authStatus, message: $message, email: $email)';

  Map<String, dynamic> toMap() {
    return {
      'authStatus': authStatusValues.reverse[authStatus],
      'message': message,
      'email': email,
    };
  }

  factory AuthState.fromMap(Map<String, dynamic> map) {
    return AuthState(
      authStatus: authStatusValues.map[map['authStatus']]!,
      message: map['message'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthState.fromJson(String source) =>
      AuthState.fromMap(json.decode(source));
}
