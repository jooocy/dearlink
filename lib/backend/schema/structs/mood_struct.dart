// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MoodStruct extends BaseStruct {
  MoodStruct({
    String? id,
    String? userId,
    String? linkId,
    String? date,
    String? moodValue,
    String? moodLabel,
    String? nickname,
    bool? hasRecorded,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : _id = id,
        _userId = userId,
        _linkId = linkId,
        _date = date,
        _moodValue = moodValue,
        _moodLabel = moodLabel,
        _nickname = nickname,
        _hasRecorded = hasRecorded,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) {
    _id = val;
    debugLog();
  }

  bool hasId() => _id != null;

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

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) {
    _date = val;
    debugLog();
  }

  bool hasDate() => _date != null;

  // "moodValue" field.
  String? _moodValue;
  String get moodValue => _moodValue ?? '';
  set moodValue(String? val) {
    _moodValue = val;
    debugLog();
  }

  bool hasMoodValue() => _moodValue != null;

  // "moodLabel" field.
  String? _moodLabel;
  String get moodLabel => _moodLabel ?? '';
  set moodLabel(String? val) {
    _moodLabel = val;
    debugLog();
  }

  bool hasMoodLabel() => _moodLabel != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) {
    _createdAt = val;
    debugLog();
  }

  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) {
    _updatedAt = val;
    debugLog();
  }

  bool hasUpdatedAt() => _updatedAt != null;

  // "nickname" field.
  String? _nickname;
  String get nickname => _nickname ?? '';
  set nickname(String? val) {
    _nickname = val;
    debugLog();
  }

  bool hasNickname() => _nickname != null;

  // "hasRecorded" field.
  bool? _hasRecorded;
  bool get hasRecorded => _hasRecorded ?? false;
  set hasRecorded(bool? val) {
    _hasRecorded = val;
    debugLog();
  }

  bool hasHasRecorded() => _hasRecorded != null;

  static MoodStruct fromMap(Map<String, dynamic> data) => MoodStruct(
        id: data['id'] as String?,
        userId: data['userId'] as String?,
        linkId: data['linkId'] as String?,
        date: data['date'] as String?,
        moodValue: data['moodValue'] as String?,
        moodLabel: data['moodLabel'] as String?,
        nickname: data['nickname'] as String?,
        hasRecorded: data['hasRecorded'] as bool?,
        createdAt: data['createdAt'] != null
            ? DateTime.parse(data['createdAt'] as String)
            : null,
        updatedAt: data['updatedAt'] != null
            ? DateTime.parse(data['updatedAt'] as String)
            : null,
      );

  static MoodStruct? maybeFromMap(dynamic data) =>
      data is Map ? MoodStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'userId': _userId,
        'linkId': _linkId,
        'date': _date,
        'moodValue': _moodValue,
        'moodLabel': _moodLabel,
        'nickname': _nickname,
        'hasRecorded': _hasRecorded,
        'createdAt': _createdAt?.millisecondsSinceEpoch,
        'updatedAt': _updatedAt?.millisecondsSinceEpoch,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
        'linkId': serializeParam(
          _linkId,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'moodValue': serializeParam(
          _moodValue,
          ParamType.String,
        ),
        'moodLabel': serializeParam(
          _moodLabel,
          ParamType.String,
        ),
        'nickname': serializeParam(
          _nickname,
          ParamType.String,
        ),
        'hasRecorded': serializeParam(
          _hasRecorded,
          ParamType.bool,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'updatedAt': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static MoodStruct fromSerializableMap(Map<String, dynamic> data) =>
      MoodStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
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
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        moodValue: deserializeParam(
          data['moodValue'],
          ParamType.String,
          false,
        ),
        moodLabel: deserializeParam(
          data['moodLabel'],
          ParamType.String,
          false,
        ),
        nickname: deserializeParam(
          data['nickname'],
          ParamType.String,
          false,
        ),
        hasRecorded: deserializeParam(
          data['hasRecorded'],
          ParamType.bool,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: deserializeParam(
          data['updatedAt'],
          ParamType.DateTime,
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
        'date': debugSerializeParam(
          date,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'moodValue': debugSerializeParam(
          moodValue,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'moodLabel': debugSerializeParam(
          moodLabel,
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
        'hasRecorded': debugSerializeParam(
          hasRecorded,
          ParamType.bool,
          name: 'bool',
          nullable: false,
        ),
        'createdAt': debugSerializeParam(
          createdAt,
          ParamType.DateTime,
          name: 'DateTime',
          nullable: false,
        ),
        'updatedAt': debugSerializeParam(
          updatedAt,
          ParamType.DateTime,
          name: 'DateTime',
          nullable: false,
        ),
      };

  @override
  String toString() => 'MoodStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MoodStruct &&
        id == other.id &&
        userId == other.userId &&
        linkId == other.linkId &&
        date == other.date &&
        moodValue == other.moodValue &&
        moodLabel == other.moodLabel &&
        nickname == other.nickname &&
        hasRecorded == other.hasRecorded &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        userId,
        linkId,
        date,
        moodValue,
        moodLabel,
        nickname,
        hasRecorded,
        createdAt,
        updatedAt,
      ]);
}
