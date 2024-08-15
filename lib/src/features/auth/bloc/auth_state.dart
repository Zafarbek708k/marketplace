part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable {

  final bool obscureText;
  final String email;
  final String password;


  const AuthState({this.obscureText = true,
    this.email = '',
    this.password = '',
  });

  AuthState copyWith({
    bool? obscureText,
    String? email,
    String? password,
  }) {
    return AuthState(
      obscureText: obscureText ?? this.obscureText,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [obscureText, email, password];
}

