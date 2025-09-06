// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthUserStruct extends BaseStruct {
  AuthUserStruct({
    String? id,
    String? idToken,
    String? email,
  })  : _id = id,
        _idToken = idToken,
        _email = email;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) {
    _id = val;
    debugLog();
  }

  bool hasId() => _id != null;

  // "idToken" field.
  String? _idToken;
  String get idToken => _idToken ?? '';
  set idToken(String? val) {
    _idToken = val;
    debugLog();
  }

  bool hasIdToken() => _idToken != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) {
    _email = val;
    debugLog();
  }

  bool hasEmail() => _email != null;

  static AuthUserStruct fromMap(Map<String, dynamic> data) => AuthUserStruct(
        id: data['id'] as String?,
        idToken: data['idToken'] as String?,
        email: data['email'] as String?,
      );

  static AuthUserStruct? maybeFromMap(dynamic data) =>
      data is Map ? AuthUserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'idToken': _idToken,
        'email': _email,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'idToken': serializeParam(
          _idToken,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
      }.withoutNulls;

  static AuthUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      AuthUserStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        idToken: deserializeParam(
          data['idToken'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
      );
  @override
  Map<String, DebugDataField> toDebugSerializableMap() => {
        'id': debugSerializeParam(
          id,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'idToken': debugSerializeParam(
          idToken,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'email': debugSerializeParam(
          email,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
      };

  @override
  String toString() => 'AuthUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AuthUserStruct &&
        id == other.id &&
        idToken == other.idToken &&
        email == other.email;
  }

  @override
  int get hashCode => const ListEquality().hash([id, idToken, email]);
}

AuthUserStruct createAuthUserStruct({
  String? id,
  String? idToken,
  String? email,
}) =>
    AuthUserStruct(
      id: id,
      idToken: idToken,
      email: email,
    );
