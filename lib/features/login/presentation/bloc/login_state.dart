part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    required this.userName,
    required this.password,
    required this.loginStatus,
  });

  final String userName;
  final String password;
  final LoginStatus loginStatus;

  factory LoginState.initial() {
    return const LoginState(
      userName: '',
      password: '',
      loginStatus: LoginStatus.initial,
    );
  }

  LoginState copyWith({
    String? userName,
    String? password,
    LoginStatus? loginStatus,
  }) {
    return LoginState(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }

  @override
  List<Object> get props => [
        userName,
        password,
        loginStatus,
      ];
}
