import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:package_info_plus/package_info_plus.dart';
part 'app_version_state.dart';

class AppVersionCubit extends Cubit<AppVersionState> {
  AppVersionCubit() : super(AppVersionInitial());

  Future<void> fetchAppVersion() async {
    try {
      final info = await PackageInfo.fromPlatform();
      emit(AppVersionLoaded(version: info.version, buildNumber: info.buildNumber));
    } catch (e) {
      print(e.toString());
      emit(AppVersionError(message: e.toString()));
    }
  }
}
