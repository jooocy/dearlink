// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LinkUserStruct extends BaseStruct {
  LinkUserStruct({
    String? userId,
    String? linkId,
    String? nickname,
    String? role,
    String? profileImageUrl,
  })  : _userId = userId,
        _linkId = linkId,
        _nickname = nickname,
        _role = role,
        _profileImageUrl = profileImageUrl;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) {
    _userId = val;
    debugLog();
  }

  bool hasUserId() => _userId != null;

  // "linkId" field.
  String? _linkId;
  String get linkId => _linkId ?? '';
  set linkId(String? val) {
    _linkId = val;
    debugLog();
  }

  bool hasLinkId() => _linkId != null;

  // "nickname" field.
  String? _nickname;
  String get nickname => _nickname ?? '';
  set nickname(String? val) {
    _nickname = val;
    debugLog();
  }

  bool hasNickname() => _nickname != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) {
    _role = val;
    debugLog();
  }

  bool hasRole() => _role != null;

  // "profileImageUrl" field.
  String? _profileImageUrl;
  String get profileImageUrl => _profileImageUrl ?? '';
  set profileImageUrl(String? val) {
    _profileImageUrl = val;
    debugLog();
  }

  bool hasProfileImageUrl() => _profileImageUrl != null;

  static LinkUserStruct fromMap(Map<String, dynamic> data) => LinkUserStruct(
        userId: data['userId'] as String?,
        linkId: data['linkId'] as String?,
        nickname: data['nickname'] as String?,
        role: data['role'] as String?,
        profileImageUrl: data['profileImageUrl'] as String?,
      );

  static LinkUserStruct? maybeFromMap(dynamic data) =>
      data is Map ? LinkUserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'userId': _userId,
        'linkId': _linkId,
        'nickname': _nickname,
        'role': _role,
        'profileImageUrl': _profileImageUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
        'linkId': serializeParam(
          _linkId,
          ParamType.String,
        ),
        'nickname': serializeParam(
          _nickname,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'profileImageUrl': serializeParam(
          _profileImageUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static LinkUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      LinkUserStruct(
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
        linkId: deserializeParam(
          data['linkId'],
          ParamType.String,
          false,
        ),
        nickname: deserializeParam(
          data['nickname'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        profileImageUrl: deserializeParam(
          data['profileImageUrl'],
          ParamType.String,
          false,
        ),
      );
  @override
  Map<String, DebugDataField> toDebugSerializableMap() => {
        'userId': debugSerializeParam(
          userId,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'linkId': debugSerializeParam(
          linkId,
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
        'role': debugSerializeParam(
          role,
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
      };

  @override
  String toString() => 'LinkUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LinkUserStruct &&
        userId == other.userId &&
        linkId == other.linkId &&
        nickname == other.nickname &&
        role == other.role &&
        profileImageUrl == other.profileImageUrl;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([userId, linkId, nickname, role, profileImageUrl]);
}

LinkUserStruct createLinkUserStruct({
  String? userId,
  String? linkId,
  String? nickname,
  String? role,
  String? profileImageUrl,
}) =>
    LinkUserStruct(
      userId: userId,
      linkId: linkId,
      nickname: nickname,
      role: role,
      profileImageUrl: profileImageUrl,
    );
