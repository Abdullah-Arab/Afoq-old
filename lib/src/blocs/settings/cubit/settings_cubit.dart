import 'package:Afoq/src/constants/api.dart';
import 'package:Afoq/src/data/models/exceptions/restapi_exception.dart';
import 'package:Afoq/src/data/models/settings/settings.dart';
import 'package:Afoq/src/data/repositories/settings_repository.dart';
import 'package:Afoq/src/services/api/append_token_interceptor.dart';
import 'package:Afoq/src/services/api/dio_factory.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  late SettingsRepository _settingsRepository;
  SettingsCubit() : super(const SettingsState.initial());

  Future<void> setSettings(Settings settings) async {
    emit(const SettingsState.loading());
    try {
      String res = await _settingsRepository.loadSettings(settings);
      emit(SettingsState.loaded(res));
    } catch (e) {
      emit(const SettingsState.error(RestApiException("Unknown error", "404")));
    }
  }
}
