part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    required this.userName,
    required this.password,
  });

  final String userName;
  final String password;

  factory LoginState.initial() {
    return const LoginState(
      userName: '',
      password: '',
    );
  }

  LoginState copyWith({
    String? userName,
    String? password,
  }) {
    return LoginState(
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [
        userName,
        password,
      ];
}
