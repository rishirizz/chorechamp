import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/enums/enums.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState.initial()) {
    on<UserNameChanged>(_onUserNameChanged);
    on<FullNameChanged>(_onFullNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<UserSignUpEvent>(_onUserSignUpEvent);
  }

  _onUserNameChanged(UserNameChanged event, Emitter<SignupState> emit) {
    emit(
      state.copyWith(
        userName: event.userName,
      ),
    );
  }

  _onFullNameChanged(FullNameChanged event, Emitter<SignupState> emit) {
    emit(
      state.copyWith(
        fullName: event.fullName,
      ),
    );
  }

  _onEmailChanged(EmailChanged event, Emitter<SignupState> emit) {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  _onPhoneNumberChanged(PhoneNumberChanged event, Emitter<SignupState> emit) {
    emit(
      state.copyWith(
        phoneNumber: event.phoneNumber,
      ),
    );
  }

  _onPasswordChanged(PasswordChanged event, Emitter<SignupState> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  _onUserSignUpEvent(UserSignUpEvent event, Emitter<SignupState> emit) async {
    emit(
      state.copyWith(
        signupStatus: SignupStatus.loading,
      ),
    );
    await Future.delayed(
      const Duration(seconds: 2),
    );
    emit(
      state.copyWith(
        userName: state.userName,
        fullName: state.fullName,
        email: state.email,
        phoneNumber: state.phoneNumber,
        password: state.password,
        signupStatus: SignupStatus.success,
      ),
    );
  }
}
