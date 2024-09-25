part of 'signup_bloc.dart';

class SignupState extends Equatable {
  const SignupState({
    required this.userName,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.signupStatus,
  });

  final String userName;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final SignupStatus signupStatus;

  factory SignupState.initial() {
    return const SignupState(
      userName: 'userName',
      fullName: '',
      email: '',
      phoneNumber: '',
      password: '',
      signupStatus: SignupStatus.initial,
    );
  }

  SignupState copyWith({
    String? userName,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? password,
    SignupStatus? signupStatus,
  }) {
    return SignupState(
      userName: userName ?? this.userName,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      signupStatus: signupStatus ?? this.signupStatus,
    );
  }

  @override
  List<Object> get props => [
        userName,
        fullName,
        email,
        phoneNumber,
        password,
        signupStatus,
      ];
}
