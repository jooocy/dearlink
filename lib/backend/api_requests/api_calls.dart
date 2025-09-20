import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Supabase Authentication Group Code

class SupabaseAuthenticationGroup {
  static String getBaseUrl({
    String? apiBaseUrl,
  }) {
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    return '${apiBaseUrl}/supabase/auth';
  }

  static Map<String, String> headers = {};
  static KakaoCall kakaoCall = KakaoCall();
}

class KakaoCall {
  Future<ApiCallResponse> call({
    String? apiBaseUrl,
  }) async {
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    final baseUrl = SupabaseAuthenticationGroup.getBaseUrl(
      apiBaseUrl: apiBaseUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'kakao',
      apiUrl: '${baseUrl}/kakao',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Supabase Authentication Group Code

/// Start Users API Group Code

class UsersAPIGroup {
  static String getBaseUrl({
    String? apiBaseUrl,
  }) {
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    return '${apiBaseUrl}/users';
  }

  static Map<String, String> headers = {};
  static FindOrCreateByEmailCall findOrCreateByEmailCall =
      FindOrCreateByEmailCall();
}

class FindOrCreateByEmailCall {
  Future<ApiCallResponse> call({
    String? supabaseApikey,
    String? authToken,
    String? apiBaseUrl,
  }) async {
    supabaseApikey ??= FFAppConstants.kSupabaseApikey;
    authToken ??= FFAppConstants.kAuthToken;
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    final baseUrl = UsersAPIGroup.getBaseUrl(
      apiBaseUrl: apiBaseUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find Or Create By  Email',
      apiUrl: '${baseUrl}/find-or-create',
      callType: ApiCallType.POST,
      headers: {
        'Apikey': '${supabaseApikey}',
        'Authorization': '${authToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.id''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  int? statusCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
}

/// End Users API Group Code

/// Start Links API Group Code

class LinksAPIGroup {
  static String getBaseUrl({
    String? apiBaseUrl,
    String? authToken,
    String? supabaseApikey,
  }) {
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    authToken ??= FFAppConstants.kAuthToken;
    supabaseApikey ??= FFAppConstants.kSupabaseApikey;
    return '${apiBaseUrl}/links';
  }

  static Map<String, String> headers = {
    'Authorization': '[authToken]',
    'Apikey': '[supabaseApikey]',
  };
  static MyLinksCall myLinksCall = MyLinksCall();
  static GetMyMainLinkCall getMyMainLinkCall = GetMyMainLinkCall();
  static EditLinkNameCall editLinkNameCall = EditLinkNameCall();
}

class MyLinksCall {
  Future<ApiCallResponse> call({
    String? apiBaseUrl,
    String? authToken,
    String? supabaseApikey,
  }) async {
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    authToken ??= FFAppConstants.kAuthToken;
    supabaseApikey ??= FFAppConstants.kSupabaseApikey;
    final baseUrl = LinksAPIGroup.getBaseUrl(
      apiBaseUrl: apiBaseUrl,
      authToken: authToken,
      supabaseApikey: supabaseApikey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'My Links',
      apiUrl: '${baseUrl}/my-links',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${authToken}',
        'Apikey': '${supabaseApikey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? linkUsers(dynamic response) => getJsonField(
        response,
        r'''$.data.linkUsers''',
        true,
      ) as List?;
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetMyMainLinkCall {
  Future<ApiCallResponse> call({
    String? apiBaseUrl,
    String? authToken,
    String? supabaseApikey,
  }) async {
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    authToken ??= FFAppConstants.kAuthToken;
    supabaseApikey ??= FFAppConstants.kSupabaseApikey;
    final baseUrl = LinksAPIGroup.getBaseUrl(
      apiBaseUrl: apiBaseUrl,
      authToken: authToken,
      supabaseApikey: supabaseApikey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get My Main Link',
      apiUrl: '${baseUrl}/my-main-link',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${authToken}',
        'Apikey': '${supabaseApikey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<LinkUserStruct>? linkUsers(dynamic response) => (getJsonField(
        response,
        r'''$.data.linkUsers''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => LinkUserStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  dynamic? link(dynamic response) => getJsonField(
        response,
        r'''$.data.link''',
      );
  String? linkName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.link.name''',
      ));
  LinkUserStruct? me(dynamic response) =>
      LinkUserStruct.maybeFromMap(getJsonField(
        response,
        r'''$.data.me''',
      ));
  List<LinkUserStruct>? others(dynamic response) => (getJsonField(
        response,
        r'''$.data.others''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => LinkUserStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  String? linkId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.link.id''',
      ));
}

class EditLinkNameCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? linkId = '',
    String? apiBaseUrl,
    String? authToken,
    String? supabaseApikey,
  }) async {
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    authToken ??= FFAppConstants.kAuthToken;
    supabaseApikey ??= FFAppConstants.kSupabaseApikey;
    final baseUrl = LinksAPIGroup.getBaseUrl(
      apiBaseUrl: apiBaseUrl,
      authToken: authToken,
      supabaseApikey: supabaseApikey,
    );

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Edit Link Name',
      apiUrl: '${baseUrl}/${linkId}/name',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': '${authToken}',
        'Apikey': '${supabaseApikey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.name''',
      ));
}

/// End Links API Group Code

/// Start Invite API Group Code

class InviteAPIGroup {
  static String getBaseUrl({
    String? apiBaseUrl,
    String? authToken,
  }) {
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    authToken ??= FFAppConstants.kAuthToken;
    return '${apiBaseUrl}/invite-codes';
  }

  static Map<String, String> headers = {
    'Authorization': '[authToken]',
  };
  static GetOrCreateActiveInviteCodeCall getOrCreateActiveInviteCodeCall =
      GetOrCreateActiveInviteCodeCall();
  static JoinByCodeCall joinByCodeCall = JoinByCodeCall();
}

class GetOrCreateActiveInviteCodeCall {
  Future<ApiCallResponse> call({
    String? linkId = '',
    String? apiBaseUrl,
    String? authToken,
  }) async {
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    authToken ??= FFAppConstants.kAuthToken;
    final baseUrl = InviteAPIGroup.getBaseUrl(
      apiBaseUrl: apiBaseUrl,
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Or Create Active Invite code',
      apiUrl: '${baseUrl}/get-or-create',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${authToken}',
      },
      params: {
        'linkId': linkId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? code(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.code''',
      ));
  String? expiresAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.expiresAt''',
      ));
  String? linkId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.linkId''',
      ));
  String? expiresAtDisplay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.expiresAtDisplay''',
      ));
}

class JoinByCodeCall {
  Future<ApiCallResponse> call({
    String? inviteCode = '',
    String? apiBaseUrl,
    String? authToken,
  }) async {
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    authToken ??= FFAppConstants.kAuthToken;
    final baseUrl = InviteAPIGroup.getBaseUrl(
      apiBaseUrl: apiBaseUrl,
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "inviteCode": "${escapeStringForJson(inviteCode)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Join By Code',
      apiUrl: '${baseUrl}/join',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Invite API Group Code

/// Start Link User Profile API Group Code

class LinkUserProfileAPIGroup {
  static String getBaseUrl({
    String? apiBaseUrl,
    String? authToken,
  }) {
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    authToken ??= FFAppConstants.kAuthToken;
    return '${apiBaseUrl}/link-user-profiles';
  }

  static Map<String, String> headers = {
    'Authorization': '[authToken]',
  };
  static GetOrCreateLinkUserCall getOrCreateLinkUserCall =
      GetOrCreateLinkUserCall();
  static UpdateLinkUserCall updateLinkUserCall = UpdateLinkUserCall();
}

class GetOrCreateLinkUserCall {
  Future<ApiCallResponse> call({
    String? linkId = '',
    String? targetUserId = '',
    String? apiBaseUrl,
    String? authToken,
  }) async {
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    authToken ??= FFAppConstants.kAuthToken;
    final baseUrl = LinkUserProfileAPIGroup.getBaseUrl(
      apiBaseUrl: apiBaseUrl,
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Or Create link user',
      apiUrl: '${baseUrl}/${linkId}/users/${targetUserId}/get-or-create',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${authToken}',
      },
      params: {
        'linkId': linkId,
        'targetUserId': targetUserId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? healthNotes(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.healthNotes''',
      ));
  String? allergies(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.allergies''',
      ));
  String? preferredFoods(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.preferredFoods''',
      ));
  String? clothingSize(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.clothingSize''',
      ));
  double? shoeSize(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.shoeSize''',
      ));
  double? weight(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.weight''',
      ));
  double? height(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.height''',
      ));
  String? familyRole(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.familyRole''',
      ));
  String? birthDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.birthDate''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.id''',
      ));
  String? bloodTypeAbo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.bloodTypeAbo''',
      ));
  String? bloodTypeRh(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.bloodTypeRh''',
      ));
  String? userNickname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.nickname''',
      ));
  String? familyRoleKorean(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.familyRoleKorean''',
      ));
}

class UpdateLinkUserCall {
  Future<ApiCallResponse> call({
    String? linkId = '',
    String? targetUserId = '',
    String? birthDate = '',
    String? familyRole = '',
    double? height,
    double? weight,
    double? shoeSize,
    String? clothingSize = '',
    String? bloodTypeAbo = '',
    String? preferredFoods = '',
    String? allergies = '',
    String? healthNotes = '',
    String? bloodTypeRh = '',
    String? apiBaseUrl,
    String? authToken,
  }) async {
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    authToken ??= FFAppConstants.kAuthToken;
    final baseUrl = LinkUserProfileAPIGroup.getBaseUrl(
      apiBaseUrl: apiBaseUrl,
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "birthDate": "${escapeStringForJson(birthDate)}",
  "familyRole": "${escapeStringForJson(familyRole)}",
  "height": ${height},
  "weight": ${weight},
  "shoeSize": ${shoeSize},
  "clothingSize": "${escapeStringForJson(clothingSize)}",
  "preferredFoods": "${escapeStringForJson(preferredFoods)}",
  "allergies": "${escapeStringForJson(allergies)}",
  "healthNotes": "${escapeStringForJson(healthNotes)}",
  "bloodTypeAbo": "${escapeStringForJson(bloodTypeAbo)}",
  "bloodTypeRh": "${escapeStringForJson(bloodTypeRh)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update link user',
      apiUrl: '${baseUrl}/${linkId}/users/${targetUserId}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? healthNotes(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.healthNotes''',
      ));
  String? allergies(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.allergies''',
      ));
  String? preferredFoods(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.preferredFoods''',
      ));
  String? bloodType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.bloodTypeAbo''',
      ));
  String? clothingSize(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.clothingSize''',
      ));
  int? shoeSize(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.shoeSize''',
      ));
  int? weight(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.weight''',
      ));
  double? height(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.height''',
      ));
  String? familyRole(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.familyRole''',
      ));
  String? birthDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.birthDate''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.id''',
      ));
  dynamic bloodTypeRh(dynamic response) => getJsonField(
        response,
        r'''$.data.bloodTypeRh''',
      );
}

/// End Link User Profile API Group Code

/// Start Questions Group Code

class QuestionsGroup {
  static String getBaseUrl({
    String? authToken,
    String? apiBaseUrl,
  }) {
    authToken ??= FFAppConstants.kAuthToken;
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    return '${apiBaseUrl}/questions';
  }

  static Map<String, String> headers = {
    'Authorization': '[authToken]',
  };
  static GetQuestionsCall getQuestionsCall = GetQuestionsCall();
  static SaveAnswerCall saveAnswerCall = SaveAnswerCall();
  static GetAnswersCall getAnswersCall = GetAnswersCall();
  static GetAnswersByQuestionCall getAnswersByQuestionCall =
      GetAnswersByQuestionCall();
  static GetUnanswerdRandomQuestionCall getUnanswerdRandomQuestionCall =
      GetUnanswerdRandomQuestionCall();
  static GenerateDailyQuestionCall generateDailyQuestionCall =
      GenerateDailyQuestionCall();
  static GenerateDailyQuestionTestCall generateDailyQuestionTestCall =
      GenerateDailyQuestionTestCall();
}

class GetQuestionsCall {
  Future<ApiCallResponse> call({
    String? linkId = '',
    String? authToken,
    String? apiBaseUrl,
  }) async {
    authToken ??= FFAppConstants.kAuthToken;
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    final baseUrl = QuestionsGroup.getBaseUrl(
      authToken: authToken,
      apiBaseUrl: apiBaseUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get questions',
      apiUrl: '${baseUrl}/link/${linkId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<QuestionStruct>? questions(dynamic response) => (getJsonField(
        response,
        r'''$.data.questions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => QuestionStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class SaveAnswerCall {
  Future<ApiCallResponse> call({
    String? linkId = '',
    String? questionId = '',
    String? answerText = '',
    List<String>? selectedOptionsList,
    String? authToken,
    String? apiBaseUrl,
  }) async {
    authToken ??= FFAppConstants.kAuthToken;
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    final baseUrl = QuestionsGroup.getBaseUrl(
      authToken: authToken,
      apiBaseUrl: apiBaseUrl,
    );
    final selectedOptions = _serializeList(selectedOptionsList);

    final ffApiRequestBody = '''
{
  "linkId": "${escapeStringForJson(linkId)}",
  "questionId": "${escapeStringForJson(questionId)}",
  "answerText": "${escapeStringForJson(answerText)}",
  "selectedOptions": ${selectedOptions}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Save Answer',
      apiUrl: '${baseUrl}/answer',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic answerId(dynamic response) => getJsonField(
        response,
        r'''$.data.answerId''',
      );
}

class GetAnswersCall {
  Future<ApiCallResponse> call({
    String? linkId = '',
    String? questionId = '',
    String? authToken,
    String? apiBaseUrl,
  }) async {
    authToken ??= FFAppConstants.kAuthToken;
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    final baseUrl = QuestionsGroup.getBaseUrl(
      authToken: authToken,
      apiBaseUrl: apiBaseUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Answers',
      apiUrl: '${baseUrl}/answers/${linkId}/${questionId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  AnswerWIthUserStruct? myAnswer(dynamic response) =>
      AnswerWIthUserStruct.maybeFromMap(getJsonField(
        response,
        r'''$.data.myAnswer''',
      ));
  List? otherAnswers(dynamic response) => getJsonField(
        response,
        r'''$.data.otherAnswers''',
        true,
      ) as List?;
}

class GetAnswersByQuestionCall {
  Future<ApiCallResponse> call({
    String? linkId = '',
    String? questionId = '',
    String? authToken,
    String? apiBaseUrl,
  }) async {
    authToken ??= FFAppConstants.kAuthToken;
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    final baseUrl = QuestionsGroup.getBaseUrl(
      authToken: authToken,
      apiBaseUrl: apiBaseUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Answers By Question',
      apiUrl: '${baseUrl}/answers/${linkId}/${questionId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  AnswerWIthUserStruct? myAnswer(dynamic response) =>
      AnswerWIthUserStruct.maybeFromMap(getJsonField(
        response,
        r'''$.data.myAnswer''',
      ));
  List? otherAnswers(dynamic response) => getJsonField(
        response,
        r'''$.data.otherAnswers''',
        true,
      ) as List?;
  List<String>? selectedOptionAnswers(dynamic response) => (getJsonField(
        response,
        r'''$.data.myAnswer.selectedOptions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetUnanswerdRandomQuestionCall {
  Future<ApiCallResponse> call({
    String? linkId = '',
    String? authToken,
    String? apiBaseUrl,
  }) async {
    authToken ??= FFAppConstants.kAuthToken;
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    final baseUrl = QuestionsGroup.getBaseUrl(
      authToken: authToken,
      apiBaseUrl: apiBaseUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Unanswerd Random Question',
      apiUrl: '${baseUrl}/random-unanswered/${linkId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${authToken}',
      },
      params: {
        'linkId': linkId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  QuestionStruct? question(dynamic response) =>
      QuestionStruct.maybeFromMap(getJsonField(
        response,
        r'''$.data.question''',
      ));
}

class GenerateDailyQuestionCall {
  Future<ApiCallResponse> call({
    String? linkId = '',
    String? authToken,
    String? apiBaseUrl,
  }) async {
    authToken ??= FFAppConstants.kAuthToken;
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    final baseUrl = QuestionsGroup.getBaseUrl(
      authToken: authToken,
      apiBaseUrl: apiBaseUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Generate daily question',
      apiUrl: '${baseUrl}/daily/${linkId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<QuestionStruct>? questions(dynamic response) => (getJsonField(
        response,
        r'''$.data.questions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => QuestionStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class GenerateDailyQuestionTestCall {
  Future<ApiCallResponse> call({
    String? linkId = '',
    String? authToken,
    String? apiBaseUrl,
  }) async {
    authToken ??= FFAppConstants.kAuthToken;
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    final baseUrl = QuestionsGroup.getBaseUrl(
      authToken: authToken,
      apiBaseUrl: apiBaseUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Generate daily question Test',
      apiUrl: '${baseUrl}/daily/${linkId}/test',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<QuestionStruct>? questions(dynamic response) => (getJsonField(
        response,
        r'''$.data.questions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => QuestionStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

/// End Questions Group Code

class CreateLinkCall {
  static Future<ApiCallResponse> call({
    String? authToken,
    String? supabaseApikey,
    String? apiBaseUrl,
    String? category = '',
  }) async {
    authToken ??= FFAppConstants.kAuthToken;
    supabaseApikey ??= FFAppConstants.kSupabaseApikey;
    apiBaseUrl ??= FFAppConstants.kBaseUrl;

    final ffApiRequestBody = '''
{
  "category": "${escapeStringForJson(category)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create link',
      apiUrl: '${apiBaseUrl}/links',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${authToken}',
        'Apikey': '${supabaseApikey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? linkId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.id''',
      ));
  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class CreateInviteCodeCall {
  static Future<ApiCallResponse> call({
    String? linkId = '',
    String? apiBaseUrl,
    String? authToken,
  }) async {
    apiBaseUrl ??= FFAppConstants.kBaseUrl;
    authToken ??= FFAppConstants.kAuthToken;

    final ffApiRequestBody = '''
{
  "linkId": "${escapeStringForJson(linkId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Invite Code',
      apiUrl: '${apiBaseUrl}/invite-codes',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? isActive(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.isActive''',
      ));
  static String? expiredsAt(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.expiresAt''',
      ));
  static String? code(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.code''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
