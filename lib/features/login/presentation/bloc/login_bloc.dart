import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<UserNameChanged>(_onUserNameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<UserNameAndPasswordSubmitted>(_onUserNameAndPasswordSubmitted);
  }

  _onUserNameChanged(UserNameChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        userName: event.userName,
      ),
    );
  }

  _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        userName: event.password,
      ),
    );
  }

  _onUserNameAndPasswordSubmitted(
      UserNameAndPasswordSubmitted event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        userName: state.userName,
        password: state.password,
      ),
    );
  }
}
