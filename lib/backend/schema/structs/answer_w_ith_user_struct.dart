// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswerWIthUserStruct extends BaseStruct {
  AnswerWIthUserStruct({
    String? id,
    String? userId,
    String? linkId,
    String? questionId,
    String? answerText,
    List<QuestionOptionStruct>? selectedOptions,
    AnswerUserStruct? user,
  })  : _id = id,
        _userId = userId,
        _linkId = linkId,
        _questionId = questionId,
        _answerText = answerText,
        _selectedOptions =
            selectedOptions != null ? LoggableList(selectedOptions) : null,
        _user = user;

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

  // "questionId" field.
  String? _questionId;
  String get questionId => _questionId ?? '';
  set questionId(String? val) {
    _questionId = val;
    debugLog();
  }

  bool hasQuestionId() => _questionId != null;

  // "answerText" field.
  String? _answerText;
  String get answerText => _answerText ?? '';
  set answerText(String? val) {
    _answerText = val;
    debugLog();
  }

  bool hasAnswerText() => _answerText != null;

  // "selectedOptions" field.
  LoggableList<QuestionOptionStruct>? _selectedOptions;
  List<QuestionOptionStruct> get selectedOptions =>
      (_selectedOptions ?? LoggableList(const []))..logger = logger;
  set selectedOptions(List<QuestionOptionStruct>? val) {
    if (val != null) {
      _selectedOptions = LoggableList(val);
    } else {
      _selectedOptions = null;
    }
    debugLog();
  }

  void updateSelectedOptions(Function(List<QuestionOptionStruct>) updateFn) {
    updateFn(_selectedOptions ??= LoggableList([]));
    debugLog();
  }

  bool hasSelectedOptions() => _selectedOptions != null;

  // "user" field.
  AnswerUserStruct? _user;
  AnswerUserStruct get user => (_user ?? AnswerUserStruct())..logger = logger;
  set user(AnswerUserStruct? val) {
    _user = val;
    debugLog();
  }

  void updateUser(Function(AnswerUserStruct) updateFn) {
    updateFn(_user ??= AnswerUserStruct());
    debugLog();
  }

  bool hasUser() => _user != null;

  static AnswerWIthUserStruct fromMap(Map<String, dynamic> data) =>
      AnswerWIthUserStruct(
        id: data['id'] as String?,
        userId: data['userId'] as String?,
        linkId: data['linkId'] as String?,
        questionId: data['questionId'] as String?,
        answerText: data['answerText'] as String?,
        selectedOptions: getStructList(
          data['selectedOptions'],
          QuestionOptionStruct.fromMap,
        ),
        user: data['user'] is AnswerUserStruct
            ? data['user']
            : AnswerUserStruct.maybeFromMap(data['user']),
      );

  static AnswerWIthUserStruct? maybeFromMap(dynamic data) => data is Map
      ? AnswerWIthUserStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'userId': _userId,
        'linkId': _linkId,
        'questionId': _questionId,
        'answerText': _answerText,
        'selectedOptions': _selectedOptions?.map((e) => e.toMap()).toList(),
        'user': _user?.toMap(),
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
        'questionId': serializeParam(
          _questionId,
          ParamType.String,
        ),
        'answerText': serializeParam(
          _answerText,
          ParamType.String,
        ),
        'selectedOptions': serializeParam(
          _selectedOptions,
          ParamType.DataStruct,
          isList: true,
        ),
        'user': serializeParam(
          _user,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AnswerWIthUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      AnswerWIthUserStruct(
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
        questionId: deserializeParam(
          data['questionId'],
          ParamType.String,
          false,
        ),
        answerText: deserializeParam(
          data['answerText'],
          ParamType.String,
          false,
        ),
        selectedOptions: deserializeStructParam<QuestionOptionStruct>(
          data['selectedOptions'],
          ParamType.DataStruct,
          true,
          structBuilder: QuestionOptionStruct.fromSerializableMap,
        ),
        user: deserializeStructParam(
          data['user'],
          ParamType.DataStruct,
          false,
          structBuilder: AnswerUserStruct.fromSerializableMap,
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
        'questionId': debugSerializeParam(
          questionId,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'answerText': debugSerializeParam(
          answerText,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'selectedOptions': debugSerializeParam(
          _selectedOptions,
          ParamType.DataStruct,
          isList: true,
          name: 'QuestionOption',
          nullable: false,
        ),
        'user': debugSerializeParam(
          _user,
          ParamType.DataStruct,
          name: 'AnswerUser',
          nullable: false,
        ),
      };

  @override
  String toString() => 'AnswerWIthUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AnswerWIthUserStruct &&
        id == other.id &&
        userId == other.userId &&
        linkId == other.linkId &&
        questionId == other.questionId &&
        answerText == other.answerText &&
        listEquality.equals(selectedOptions, other.selectedOptions) &&
        user == other.user;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, userId, linkId, questionId, answerText, selectedOptions, user]);
}

AnswerWIthUserStruct createAnswerWIthUserStruct({
  String? id,
  String? userId,
  String? linkId,
  String? questionId,
  String? answerText,
  AnswerUserStruct? user,
}) =>
    AnswerWIthUserStruct(
      id: id,
      userId: userId,
      linkId: linkId,
      questionId: questionId,
      answerText: answerText,
      user: user ?? AnswerUserStruct(),
    );
