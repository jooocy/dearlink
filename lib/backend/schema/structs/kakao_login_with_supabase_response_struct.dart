// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KakaoLoginWithSupabaseResponseStruct extends BaseStruct {
  KakaoLoginWithSupabaseResponseStruct({
    bool? success,
    bool? isNewUser,
    String? email,
    String? password,
    String? error,
  })  : _success = success,
        _isNewUser = isNewUser,
        _email = email,
        _password = password,
        _error = error;

  // "success" field.
  bool? _success;
  bool get success => _success ?? false;
  set success(bool? val) {
    _success = val;
    debugLog();
  }

  bool hasSuccess() => _success != null;

  // "is_new_user" field.
  bool? _isNewUser;
  bool get isNewUser => _isNewUser ?? false;
  set isNewUser(bool? val) {
    _isNewUser = val;
    debugLog();
  }

  bool hasIsNewUser() => _isNewUser != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) {
    _email = val;
    debugLog();
  }

  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) {
    _password = val;
    debugLog();
  }

  bool hasPassword() => _password != null;

  // "error" field.
  String? _error;
  String get error => _error ?? '';
  set error(String? val) {
    _error = val;
    debugLog();
  }

  bool hasError() => _error != null;

  static KakaoLoginWithSupabaseResponseStruct fromMap(
          Map<String, dynamic> data) =>
      KakaoLoginWithSupabaseResponseStruct(
        success: data['success'] as bool?,
        isNewUser: data['is_new_user'] as bool?,
        email: data['email'] as String?,
        password: data['password'] as String?,
        error: data['error'] as String?,
      );

  static KakaoLoginWithSupabaseResponseStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? KakaoLoginWithSupabaseResponseStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'success': _success,
        'is_new_user': _isNewUser,
        'email': _email,
        'password': _password,
        'error': _error,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'success': serializeParam(
          _success,
          ParamType.bool,
        ),
        'is_new_user': serializeParam(
          _isNewUser,
          ParamType.bool,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
        'error': serializeParam(
          _error,
          ParamType.String,
        ),
      }.withoutNulls;

  static KakaoLoginWithSupabaseResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      KakaoLoginWithSupabaseResponseStruct(
        success: deserializeParam(
          data['success'],
          ParamType.bool,
          false,
        ),
        isNewUser: deserializeParam(
          data['is_new_user'],
          ParamType.bool,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
        error: deserializeParam(
          data['error'],
          ParamType.String,
          false,
        ),
      );
  @override
  Map<String, DebugDataField> toDebugSerializableMap() => {
        'success': debugSerializeParam(
          success,
          ParamType.bool,
          name: 'bool',
          nullable: false,
        ),
        'is_new_user': debugSerializeParam(
          isNewUser,
          ParamType.bool,
          name: 'bool',
          nullable: false,
        ),
        'email': debugSerializeParam(
          email,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'password': debugSerializeParam(
          password,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'error': debugSerializeParam(
          error,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
      };

  @override
  String toString() => 'KakaoLoginWithSupabaseResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is KakaoLoginWithSupabaseResponseStruct &&
        success == other.success &&
        isNewUser == other.isNewUser &&
        email == other.email &&
        password == other.password &&
        error == other.error;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([success, isNewUser, email, password, error]);
}

KakaoLoginWithSupabaseResponseStruct
    createKakaoLoginWithSupabaseResponseStruct({
  bool? success,
  bool? isNewUser,
  String? email,
  String? password,
  String? error,
}) =>
        KakaoLoginWithSupabaseResponseStruct(
          success: success,
          isNewUser: isNewUser,
          email: email,
          password: password,
          error: error,
        );
