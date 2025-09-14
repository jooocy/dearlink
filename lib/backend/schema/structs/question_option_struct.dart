// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionOptionStruct extends BaseStruct {
  QuestionOptionStruct({
    String? value,
    String? label,
  })  : _value = value,
        _label = label;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) {
    _value = val;
    debugLog();
  }

  bool hasValue() => _value != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) {
    _label = val;
    debugLog();
  }

  bool hasLabel() => _label != null;

  static QuestionOptionStruct fromMap(Map<String, dynamic> data) =>
      QuestionOptionStruct(
        value: data['value'] as String?,
        label: data['label'] as String?,
      );

  static QuestionOptionStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionOptionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'value': _value,
        'label': _label,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuestionOptionStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionOptionStruct(
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
      );
  @override
  Map<String, DebugDataField> toDebugSerializableMap() => {
        'value': debugSerializeParam(
          value,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'label': debugSerializeParam(
          label,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
      };

  @override
  String toString() => 'QuestionOptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuestionOptionStruct &&
        value == other.value &&
        label == other.label;
  }

  @override
  int get hashCode => const ListEquality().hash([value, label]);
}

QuestionOptionStruct createQuestionOptionStruct({
  String? value,
  String? label,
}) =>
    QuestionOptionStruct(
      value: value,
      label: label,
    );
