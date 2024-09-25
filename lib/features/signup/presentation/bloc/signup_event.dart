part of 'signup_bloc.dart';

class SignupEvent extends Equatable {
  const SignupEvent();
  @override
  List<Object> get props => [];
}

class UserNameChanged extends SignupEvent {
  const UserNameChanged({required this.userName});
  final String userName;

  @override
  List<Object> get props => [userName];
}

class FullNameChanged extends SignupEvent {
  const FullNameChanged({required this.fullName});
  final String fullName;

  @override
  List<Object> get props => [fullName];
}

class EmailChanged extends SignupEvent {
  const EmailChanged({required this.email});
  final String email;

  @override
  List<Object> get props => [email];
}

class PhoneNumberChanged extends SignupEvent {
  const PhoneNumberChanged({required this.phoneNumber});
  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class PasswordChanged extends SignupEvent {
  const PasswordChanged({required this.password});
  final String password;
  @override
  List<Object> get props => [password];
}

class UserSignUpEvent extends SignupEvent {}
