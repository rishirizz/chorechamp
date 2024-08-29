part of 'app_info_bloc.dart';

class AppInfoState extends Equatable {
  const AppInfoState({
    required this.appInfoStatus,
    required this.version,
    required this.packageName,
    required this.errorText,
  });

  final AppInfoStatus appInfoStatus;
  final String version;
  final String packageName;
  final String errorText;

  factory AppInfoState.initial() {
    return const AppInfoState(
      appInfoStatus: AppInfoStatus.initial,
      version: '',
      packageName: '',
      errorText: '',
    );
  }

  AppInfoState copyWith({
    AppInfoStatus? appInfoStatus,
    String? version,
    String? packageName,
    String? errorText,
  }) {
    return AppInfoState(
      appInfoStatus: appInfoStatus ?? this.appInfoStatus,
      version: version ?? this.version,
      packageName: packageName ?? this.packageName,
      errorText: errorText ?? this.errorText,
    );
  }

  @override
  List<Object> get props => [
        appInfoStatus,
        version,
        packageName,
        errorText,
      ];
}
