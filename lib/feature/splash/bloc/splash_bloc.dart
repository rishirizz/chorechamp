import 'package:bloc/bloc.dart';
import 'package:chorechamp/core/enums.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState.initial()) {
    on<SplashLoaded>(_splashLoaded);
  }

  _splashLoaded(SplashLoaded event, Emitter<SplashState> emit) async {
    emit(state.copyWith(
      splashStatus: SplashStatus.loading,
    ));
    await Future.delayed(
      const Duration(seconds: 2),
    );
    emit(
      state.copyWith(
        splashStatus: SplashStatus.success,
      ),
    );
  }
}
