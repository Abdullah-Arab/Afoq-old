import 'package:Afoq/src/constants/api.dart';
import 'package:Afoq/src/data/models/auth/auth.dart';
import 'package:Afoq/src/data/models/settings/settings.dart';
import 'package:Afoq/src/services/logger/logger.dart';
import 'package:Afoq/src/services/service_locator/locator.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl/intl.dart';

abstract class ApiService {
  const ApiService(this._dio);

  final Dio _dio;

  Future<Auth> login(String email, String password);

  Future<Auth> register(
      String email,
      String password,
      String name,
      String ownerName,
      String phone,
      String phone2,
      String address,
      String passwordConfirmation);

  Future<void> deleteAccount();


  Future<String> setSettings(Settings settings);
}

