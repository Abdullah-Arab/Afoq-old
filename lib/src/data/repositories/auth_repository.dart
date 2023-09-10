import 'dart:convert';

import 'package:Afoq/src/data/models/auth/auth.dart';
import 'package:Afoq/src/data/models/auth/user.dart';
import 'package:Afoq/src/services/api/api_service.dart';
import 'package:Afoq/src/services/firebase/firebase_sevice.dart';
import 'package:Afoq/src/services/logger/logger.dart';
import 'package:Afoq/src/services/service_locator/locator.dart';
import 'package:Afoq/src/services/storage/storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../constants/storage_keys.dart';

class AuthRepository {
  final FirebaseService _firebaseService = locator<FirebaseService>();
  AuthRepository();

  Future<Auth> login(String email, String password) async {
    final _userCredential = await _firebaseService.login(email, password);
    final Auth auth = Auth(
      user: AfoqUser(
        email: _userCredential!.user!.email!,
        name: _userCredential.user!.displayName!,
        phone: _userCredential.user!.phoneNumber!,
        uid: _userCredential.user!.uid,
      ),
      token: _userCredential.credential!.accessToken.toString(),
    );

    await locator<StorageService>().setString(
      StorageKeys.authKey,
      jsonEncode(auth.toJson()),
    );
    return auth;
  }

  Future<Auth> register(String email, String password) async {
    final UserCredential? _userCredential =
        await _firebaseService.register(email, password);
    locator<Log>().fatal(_userCredential);
    if (_userCredential == null) {
      throw 'non';
    }

    final Auth auth = Auth(
      user: AfoqUser(
        email: _userCredential!.user!.email!,
        name: _userCredential.user!.displayName!,
        phone: _userCredential.user!.phoneNumber!,
        uid: _userCredential.user!.uid,
      ),
      token: _userCredential.credential!.accessToken.toString(),
    );

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
    await _firebaseService.logout();
    await locator<StorageService>().clearAll();
  }

  Future<void> deleteAccount() async {
    _firebaseService.deleteAccount();
    logout();
  }
}
