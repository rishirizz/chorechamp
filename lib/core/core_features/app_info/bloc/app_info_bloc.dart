
import 'package:bloc/bloc.dart';
import 'package:chorechamp/core/enums/enums.dart';
import 'package:equatable/equatable.dart';

import '../app_info.dart';

part 'app_info_event.dart';
part 'app_info_state.dart';

class AppInfoBloc extends Bloc<AppInfoEvent, AppInfoState> {
  AppInfoBloc() : super(AppInfoState.initial()) {
    on<AppInfoLoaded>(_onAppInfoLoaded);
  }

  _onAppInfoLoaded(AppInfoLoaded event, Emitter<AppInfoState> emit) async {
    try {
      emit(
        state.copyWith(
          appInfoStatus: AppInfoStatus.loading,
        ),
      );
      String version = await AppInfo.getAppVersion();
      String packageName = await AppInfo.getPackageName();
      emit(
        state.copyWith(
          appInfoStatus: AppInfoStatus.success,
          version: version,
          packageName: packageName,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          appInfoStatus: AppInfoStatus.failure,
          errorText: e.toString(),
        ),
      );
    }
  }
}
