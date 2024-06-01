part of 'app_version_cubit.dart';

sealed class AppVersionState extends Equatable {
  const AppVersionState();

  @override
  List<Object> get props => [];
}

final class AppVersionInitial extends AppVersionState {}

final class AppVersionLoaded extends AppVersionState {
  final String version;
  final String buildNumber;

  const AppVersionLoaded({required this.version, required this.buildNumber});

  @override
  List<Object> get props => [version, buildNumber];
}

final class AppVersionError extends AppVersionState {
  final String message;

  const AppVersionError({required this.message});

  @override
  List<Object> get props => [message];
}