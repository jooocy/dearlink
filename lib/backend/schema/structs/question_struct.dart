// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionStruct extends BaseStruct {
  QuestionStruct({
    String? id,
    String? linkId,
    String? questionId,
    String? questionText,
    String? questionType,
    List<QuestionOptionStruct>? options,
    int? orderIndex,
    bool? isAnswered,
  })  : _id = id,
        _linkId = linkId,
        _questionId = questionId,
        _questionText = questionText,
        _questionType = questionType,
        _options = options != null ? LoggableList(options) : null,
        _orderIndex = orderIndex,
        _isAnswered = isAnswered;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) {
    _id = val;
    debugLog();
  }

  bool hasId() => _id != null;

  // "linkId" field.
  String? _linkId;
  String get linkId => _linkId ?? '';
  set linkId(String? val) {
    _linkId = val;
    debugLog();
  }

  bool hasLinkId() => _linkId != null;

  // "questionId" field.
  String? _questionId;
  String get questionId => _questionId ?? '';
  set questionId(String? val) {
    _questionId = val;
    debugLog();
  }

  bool hasQuestionId() => _questionId != null;

  // "questionText" field.
  String? _questionText;
  String get questionText => _questionText ?? '';
  set questionText(String? val) {
    _questionText = val;
    debugLog();
  }

  bool hasQuestionText() => _questionText != null;

  // "questionType" field.
  String? _questionType;
  String get questionType => _questionType ?? '';
  set questionType(String? val) {
    _questionType = val;
    debugLog();
  }

  bool hasQuestionType() => _questionType != null;

  // "options" field.
  LoggableList<QuestionOptionStruct>? _options;
  List<QuestionOptionStruct> get options =>
      (_options ?? LoggableList(const []))..logger = logger;
  set options(List<QuestionOptionStruct>? val) {
    if (val != null) {
      _options = LoggableList(val);
    } else {
      _options = null;
    }
    debugLog();
  }

  void updateOptions(Function(List<QuestionOptionStruct>) updateFn) {
    updateFn(_options ??= LoggableList([]));
    debugLog();
  }

  bool hasOptions() => _options != null;

  // "orderIndex" field.
  int? _orderIndex;
  int get orderIndex => _orderIndex ?? 0;
  set orderIndex(int? val) {
    _orderIndex = val;
    debugLog();
  }

  void incrementOrderIndex(int amount) => orderIndex = orderIndex + amount;

  bool hasOrderIndex() => _orderIndex != null;

  // "isAnswered" field.
  bool? _isAnswered;
  bool get isAnswered => _isAnswered ?? false;
  set isAnswered(bool? val) {
    _isAnswered = val;
    debugLog();
  }

  bool hasIsAnswered() => _isAnswered != null;

  static QuestionStruct fromMap(Map<String, dynamic> data) => QuestionStruct(
        id: data['id'] as String?,
        linkId: data['linkId'] as String?,
        questionId: data['questionId'] as String?,
        questionText: data['questionText'] as String?,
        questionType: data['questionType'] as String?,
        options: getStructList(
          data['options'],
          QuestionOptionStruct.fromMap,
        ),
        orderIndex: castToType<int>(data['orderIndex']),
        isAnswered: data['isAnswered'] as bool?,
      );

  static QuestionStruct? maybeFromMap(dynamic data) =>
      data is Map ? QuestionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'linkId': _linkId,
        'questionId': _questionId,
        'questionText': _questionText,
        'questionType': _questionType,
        'options': _options?.map((e) => e.toMap()).toList(),
        'orderIndex': _orderIndex,
        'isAnswered': _isAnswered,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'linkId': serializeParam(
          _linkId,
          ParamType.String,
        ),
        'questionId': serializeParam(
          _questionId,
          ParamType.String,
        ),
        'questionText': serializeParam(
          _questionText,
          ParamType.String,
        ),
        'questionType': serializeParam(
          _questionType,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.DataStruct,
          isList: true,
        ),
        'orderIndex': serializeParam(
          _orderIndex,
          ParamType.int,
        ),
        'isAnswered': serializeParam(
          _isAnswered,
          ParamType.bool,
        ),
      }.withoutNulls;

  static QuestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        linkId: deserializeParam(
          data['linkId'],
          ParamType.String,
          false,
        ),
        questionId: deserializeParam(
          data['questionId'],
          ParamType.String,
          false,
        ),
        questionText: deserializeParam(
          data['questionText'],
          ParamType.String,
          false,
        ),
        questionType: deserializeParam(
          data['questionType'],
          ParamType.String,
          false,
        ),
        options: deserializeStructParam<QuestionOptionStruct>(
          data['options'],
          ParamType.DataStruct,
          true,
          structBuilder: QuestionOptionStruct.fromSerializableMap,
        ),
        orderIndex: deserializeParam(
          data['orderIndex'],
          ParamType.int,
          false,
        ),
        isAnswered: deserializeParam(
          data['isAnswered'],
          ParamType.bool,
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
        'linkId': debugSerializeParam(
          linkId,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'questionId': debugSerializeParam(
          questionId,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'questionText': debugSerializeParam(
          questionText,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'questionType': debugSerializeParam(
          questionType,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'options': debugSerializeParam(
          _options,
          ParamType.DataStruct,
          isList: true,
          name: 'QuestionOption',
          nullable: false,
        ),
        'orderIndex': debugSerializeParam(
          orderIndex,
          ParamType.int,
          name: 'int',
          nullable: false,
        ),
        'isAnswered': debugSerializeParam(
          isAnswered,
          ParamType.bool,
          name: 'bool',
          nullable: false,
        ),
      };

  @override
  String toString() => 'QuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionStruct &&
        id == other.id &&
        linkId == other.linkId &&
        questionId == other.questionId &&
        questionText == other.questionText &&
        questionType == other.questionType &&
        listEquality.equals(options, other.options) &&
        orderIndex == other.orderIndex &&
        isAnswered == other.isAnswered;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        linkId,
        questionId,
        questionText,
        questionType,
        options,
        orderIndex,
        isAnswered
      ]);
}

QuestionStruct createQuestionStruct({
  String? id,
  String? linkId,
  String? questionId,
  String? questionText,
  String? questionType,
  int? orderIndex,
  bool? isAnswered,
}) =>
    QuestionStruct(
      id: id,
      linkId: linkId,
      questionId: questionId,
      questionText: questionText,
      questionType: questionType,
      orderIndex: orderIndex,
      isAnswered: isAnswered,
    );
