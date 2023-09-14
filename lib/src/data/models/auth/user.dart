

import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class AfoqUser with _$AfoqUser{
  const factory AfoqUser({
    required String uid,
    required String? name,
    required String email,
    required String? phone,

  }) = _AfoqUser;

  factory AfoqUser.fromJson(Map<String, dynamic> json) => _$AfoqUserFromJson(json);
}