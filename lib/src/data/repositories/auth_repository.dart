import 'dart:convert';

import 'package:Afoq/src/data/models/auth/auth.dart';
import 'package:Afoq/src/services/api/api_service.dart';
import 'package:Afoq/src/services/service_locator/locator.dart';
import 'package:Afoq/src/services/storage/storage_service.dart';

import '../../constants/storage_keys.dart';

class AuthRepository {
  late ApiService _apiService;
  AuthRepository(this._apiService);

  Future<Auth> login(String email, String password) async {
    final auth = await _apiService.login(email, password);
    await locator<StorageService>().setString(
      StorageKeys.authKey,
      jsonEncode(auth.toJson()),
    );
    return auth;
  }

  Future<Auth> register(
      String email,
      String password,
      String name,
      String ownerName,
      String phone,
      String phone2,
      String address,
      String passwordConfirmation) async {
    final auth = await _apiService.register(email, password, name, ownerName,
        phone, phone2, address, passwordConfirmation);
    await locator<StorageService>().setString(
      StorageKeys.authKey,
      jsonEncode(auth.toJson()),
    );
    return auth;
  }

  Future<Auth?> getAuth() async {
    final auth = await locator<StorageService>().getString(StorageKeys.authKey);
    if (auth == null) {
      return null;
    }
    return Auth.fromJson(jsonDecode(auth));
  }

  Future<void> logout() async {
    await locator<StorageService>().clearAll();
  }

  Future<void> deleteAccount() async {
    await _apiService.deleteAccount();
    await logout();
  }
}
