// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswerUserStruct extends BaseStruct {
  AnswerUserStruct({
    String? id,
    String? nickname,
    String? profileImageUrl,
    String? displayName,
  })  : _id = id,
        _nickname = nickname,
        _profileImageUrl = profileImageUrl,
        _displayName = displayName;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) {
    _id = val;
    debugLog();
  }

  bool hasId() => _id != null;

  // "nickname" field.
  String? _nickname;
  String get nickname => _nickname ?? '';
  set nickname(String? val) {
    _nickname = val;
    debugLog();
  }

  bool hasNickname() => _nickname != null;

  // "profileImageUrl" field.
  String? _profileImageUrl;
  String get profileImageUrl => _profileImageUrl ?? '';
  set profileImageUrl(String? val) {
    _profileImageUrl = val;
    debugLog();
  }

  bool hasProfileImageUrl() => _profileImageUrl != null;

  // "displayName" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) {
    _displayName = val;
    debugLog();
  }

  bool hasDisplayName() => _displayName != null;

  static AnswerUserStruct fromMap(Map<String, dynamic> data) =>
      AnswerUserStruct(
        id: data['id'] as String?,
        nickname: data['nickname'] as String?,
        profileImageUrl: data['profileImageUrl'] as String?,
        displayName: data['displayName'] as String?,
      );

  static AnswerUserStruct? maybeFromMap(dynamic data) => data is Map
      ? AnswerUserStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nickname': _nickname,
        'profileImageUrl': _profileImageUrl,
        'displayName': _displayName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'nickname': serializeParam(
          _nickname,
          ParamType.String,
        ),
        'profileImageUrl': serializeParam(
          _profileImageUrl,
          ParamType.String,
        ),
        'displayName': serializeParam(
          _displayName,
          ParamType.String,
        ),
      }.withoutNulls;

  static AnswerUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      AnswerUserStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        nickname: deserializeParam(
          data['nickname'],
          ParamType.String,
          false,
        ),
        profileImageUrl: deserializeParam(
          data['profileImageUrl'],
          ParamType.String,
          false,
        ),
        displayName: deserializeParam(
          data['displayName'],
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
        'nickname': debugSerializeParam(
          nickname,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'profileImageUrl': debugSerializeParam(
          profileImageUrl,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'displayName': debugSerializeParam(
          displayName,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
      };

  @override
  String toString() => 'AnswerUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AnswerUserStruct &&
        id == other.id &&
        nickname == other.nickname &&
        profileImageUrl == other.profileImageUrl &&
        displayName == other.displayName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, nickname, profileImageUrl, displayName]);
}

AnswerUserStruct createAnswerUserStruct({
  String? id,
  String? nickname,
  String? profileImageUrl,
  String? displayName,
}) =>
    AnswerUserStruct(
      id: id,
      nickname: nickname,
      profileImageUrl: profileImageUrl,
      displayName: displayName,
    );
