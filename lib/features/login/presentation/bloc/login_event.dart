part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class UserNameChanged extends LoginEvent {
  const UserNameChanged({required this.userName});
  final String userName;

  @override
  List<Object> get props => [userName];
}

class PasswordChanged extends LoginEvent {
  const PasswordChanged({required this.password});
  final String password;
  @override
  List<Object> get props => [password];
}

class UserNameAndPasswordSubmitted extends LoginEvent {}
