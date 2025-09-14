// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserInfoStruct extends BaseStruct {
  UserInfoStruct({
    String? birthDate,
    FamilyRole? familyRole,
    double? height,
    double? weight,
    double? shoeSize,
    String? clothingSize,
    BloodTypeAbo? bloodTypeAbo,
    BloodTypeRh? bloodTypeRh,
    String? preferredFoods,
    String? allergies,
    String? healthNotes,
    String? birthDateKorean,
    String? familyRoleKorean,
    String? nickname,
  })  : _birthDate = birthDate,
        _familyRole = familyRole,
        _height = height,
        _weight = weight,
        _shoeSize = shoeSize,
        _clothingSize = clothingSize,
        _bloodTypeAbo = bloodTypeAbo,
        _bloodTypeRh = bloodTypeRh,
        _preferredFoods = preferredFoods,
        _allergies = allergies,
        _healthNotes = healthNotes,
        _birthDateKorean = birthDateKorean,
        _familyRoleKorean = familyRoleKorean,
        _nickname = nickname;

  // "birthDate" field.
  String? _birthDate;
  String get birthDate => _birthDate ?? '';
  set birthDate(String? val) {
    _birthDate = val;
    debugLog();
  }

  bool hasBirthDate() => _birthDate != null;

  // "familyRole" field.
  FamilyRole? _familyRole;
  FamilyRole? get familyRole => _familyRole;
  set familyRole(FamilyRole? val) {
    _familyRole = val;
    debugLog();
  }

  bool hasFamilyRole() => _familyRole != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  set height(double? val) {
    _height = val;
    debugLog();
  }

  void incrementHeight(double amount) => height = height + amount;

  bool hasHeight() => _height != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  set weight(double? val) {
    _weight = val;
    debugLog();
  }

  void incrementWeight(double amount) => weight = weight + amount;

  bool hasWeight() => _weight != null;

  // "shoeSize" field.
  double? _shoeSize;
  double get shoeSize => _shoeSize ?? 0.0;
  set shoeSize(double? val) {
    _shoeSize = val;
    debugLog();
  }

  void incrementShoeSize(double amount) => shoeSize = shoeSize + amount;

  bool hasShoeSize() => _shoeSize != null;

  // "clothingSize" field.
  String? _clothingSize;
  String get clothingSize => _clothingSize ?? '';
  set clothingSize(String? val) {
    _clothingSize = val;
    debugLog();
  }

  bool hasClothingSize() => _clothingSize != null;

  // "bloodTypeAbo" field.
  BloodTypeAbo? _bloodTypeAbo;
  BloodTypeAbo? get bloodTypeAbo => _bloodTypeAbo;
  set bloodTypeAbo(BloodTypeAbo? val) {
    _bloodTypeAbo = val;
    debugLog();
  }

  bool hasBloodTypeAbo() => _bloodTypeAbo != null;

  // "bloodTypeRh" field.
  BloodTypeRh? _bloodTypeRh;
  BloodTypeRh? get bloodTypeRh => _bloodTypeRh;
  set bloodTypeRh(BloodTypeRh? val) {
    _bloodTypeRh = val;
    debugLog();
  }

  bool hasBloodTypeRh() => _bloodTypeRh != null;

  // "preferredFoods" field.
  String? _preferredFoods;
  String get preferredFoods => _preferredFoods ?? '';
  set preferredFoods(String? val) {
    _preferredFoods = val;
    debugLog();
  }

  bool hasPreferredFoods() => _preferredFoods != null;

  // "allergies" field.
  String? _allergies;
  String get allergies => _allergies ?? '';
  set allergies(String? val) {
    _allergies = val;
    debugLog();
  }

  bool hasAllergies() => _allergies != null;

  // "healthNotes" field.
  String? _healthNotes;
  String get healthNotes => _healthNotes ?? '';
  set healthNotes(String? val) {
    _healthNotes = val;
    debugLog();
  }

  bool hasHealthNotes() => _healthNotes != null;

  // "birthDateKorean" field.
  String? _birthDateKorean;
  String get birthDateKorean => _birthDateKorean ?? '';
  set birthDateKorean(String? val) {
    _birthDateKorean = val;
    debugLog();
  }

  bool hasBirthDateKorean() => _birthDateKorean != null;

  // "familyRoleKorean" field.
  String? _familyRoleKorean;
  String get familyRoleKorean => _familyRoleKorean ?? '';
  set familyRoleKorean(String? val) {
    _familyRoleKorean = val;
    debugLog();
  }

  bool hasFamilyRoleKorean() => _familyRoleKorean != null;

  // "nickname" field.
  String? _nickname;
  String get nickname => _nickname ?? '';
  set nickname(String? val) {
    _nickname = val;
    debugLog();
  }

  bool hasNickname() => _nickname != null;

  static UserInfoStruct fromMap(Map<String, dynamic> data) => UserInfoStruct(
        birthDate: data['birthDate'] as String?,
        familyRole: data['familyRole'] is FamilyRole
            ? data['familyRole']
            : deserializeEnum<FamilyRole>(data['familyRole']),
        height: castToType<double>(data['height']),
        weight: castToType<double>(data['weight']),
        shoeSize: castToType<double>(data['shoeSize']),
        clothingSize: data['clothingSize'] as String?,
        bloodTypeAbo: data['bloodTypeAbo'] is BloodTypeAbo
            ? data['bloodTypeAbo']
            : deserializeEnum<BloodTypeAbo>(data['bloodTypeAbo']),
        bloodTypeRh: data['bloodTypeRh'] is BloodTypeRh
            ? data['bloodTypeRh']
            : deserializeEnum<BloodTypeRh>(data['bloodTypeRh']),
        preferredFoods: data['preferredFoods'] as String?,
        allergies: data['allergies'] as String?,
        healthNotes: data['healthNotes'] as String?,
        birthDateKorean: data['birthDateKorean'] as String?,
        familyRoleKorean: data['familyRoleKorean'] as String?,
        nickname: data['nickname'] as String?,
      );

  static UserInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'birthDate': _birthDate,
        'familyRole': _familyRole?.serialize(),
        'height': _height,
        'weight': _weight,
        'shoeSize': _shoeSize,
        'clothingSize': _clothingSize,
        'bloodTypeAbo': _bloodTypeAbo?.serialize(),
        'bloodTypeRh': _bloodTypeRh?.serialize(),
        'preferredFoods': _preferredFoods,
        'allergies': _allergies,
        'healthNotes': _healthNotes,
        'birthDateKorean': _birthDateKorean,
        'familyRoleKorean': _familyRoleKorean,
        'nickname': _nickname,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'birthDate': serializeParam(
          _birthDate,
          ParamType.String,
        ),
        'familyRole': serializeParam(
          _familyRole,
          ParamType.Enum,
        ),
        'height': serializeParam(
          _height,
          ParamType.double,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.double,
        ),
        'shoeSize': serializeParam(
          _shoeSize,
          ParamType.double,
        ),
        'clothingSize': serializeParam(
          _clothingSize,
          ParamType.String,
        ),
        'bloodTypeAbo': serializeParam(
          _bloodTypeAbo,
          ParamType.Enum,
        ),
        'bloodTypeRh': serializeParam(
          _bloodTypeRh,
          ParamType.Enum,
        ),
        'preferredFoods': serializeParam(
          _preferredFoods,
          ParamType.String,
        ),
        'allergies': serializeParam(
          _allergies,
          ParamType.String,
        ),
        'healthNotes': serializeParam(
          _healthNotes,
          ParamType.String,
        ),
        'birthDateKorean': serializeParam(
          _birthDateKorean,
          ParamType.String,
        ),
        'familyRoleKorean': serializeParam(
          _familyRoleKorean,
          ParamType.String,
        ),
        'nickname': serializeParam(
          _nickname,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserInfoStruct(
        birthDate: deserializeParam(
          data['birthDate'],
          ParamType.String,
          false,
        ),
        familyRole: deserializeParam<FamilyRole>(
          data['familyRole'],
          ParamType.Enum,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.double,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        shoeSize: deserializeParam(
          data['shoeSize'],
          ParamType.double,
          false,
        ),
        clothingSize: deserializeParam(
          data['clothingSize'],
          ParamType.String,
          false,
        ),
        bloodTypeAbo: deserializeParam<BloodTypeAbo>(
          data['bloodTypeAbo'],
          ParamType.Enum,
          false,
        ),
        bloodTypeRh: deserializeParam<BloodTypeRh>(
          data['bloodTypeRh'],
          ParamType.Enum,
          false,
        ),
        preferredFoods: deserializeParam(
          data['preferredFoods'],
          ParamType.String,
          false,
        ),
        allergies: deserializeParam(
          data['allergies'],
          ParamType.String,
          false,
        ),
        healthNotes: deserializeParam(
          data['healthNotes'],
          ParamType.String,
          false,
        ),
        birthDateKorean: deserializeParam(
          data['birthDateKorean'],
          ParamType.String,
          false,
        ),
        familyRoleKorean: deserializeParam(
          data['familyRoleKorean'],
          ParamType.String,
          false,
        ),
        nickname: deserializeParam(
          data['nickname'],
          ParamType.String,
          false,
        ),
      );
  @override
  Map<String, DebugDataField> toDebugSerializableMap() => {
        'birthDate': debugSerializeParam(
          birthDate,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'familyRole': debugSerializeParam(
          _familyRole,
          ParamType.Enum,
          name: 'FamilyRole',
          nullable: true,
        ),
        'height': debugSerializeParam(
          height,
          ParamType.double,
          name: 'double',
          nullable: false,
        ),
        'weight': debugSerializeParam(
          weight,
          ParamType.double,
          name: 'double',
          nullable: false,
        ),
        'shoeSize': debugSerializeParam(
          shoeSize,
          ParamType.double,
          name: 'double',
          nullable: false,
        ),
        'clothingSize': debugSerializeParam(
          clothingSize,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'bloodTypeAbo': debugSerializeParam(
          _bloodTypeAbo,
          ParamType.Enum,
          name: 'BloodTypeAbo',
          nullable: true,
        ),
        'bloodTypeRh': debugSerializeParam(
          _bloodTypeRh,
          ParamType.Enum,
          name: 'BloodTypeRh',
          nullable: true,
        ),
        'preferredFoods': debugSerializeParam(
          preferredFoods,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'allergies': debugSerializeParam(
          allergies,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'healthNotes': debugSerializeParam(
          healthNotes,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'birthDateKorean': debugSerializeParam(
          birthDateKorean,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'familyRoleKorean': debugSerializeParam(
          familyRoleKorean,
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
      };

  @override
  String toString() => 'UserInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserInfoStruct &&
        birthDate == other.birthDate &&
        familyRole == other.familyRole &&
        height == other.height &&
        weight == other.weight &&
        shoeSize == other.shoeSize &&
        clothingSize == other.clothingSize &&
        bloodTypeAbo == other.bloodTypeAbo &&
        bloodTypeRh == other.bloodTypeRh &&
        preferredFoods == other.preferredFoods &&
        allergies == other.allergies &&
        healthNotes == other.healthNotes &&
        birthDateKorean == other.birthDateKorean &&
        familyRoleKorean == other.familyRoleKorean &&
        nickname == other.nickname;
  }

  @override
  int get hashCode => const ListEquality().hash([
        birthDate,
        familyRole,
        height,
        weight,
        shoeSize,
        clothingSize,
        bloodTypeAbo,
        bloodTypeRh,
        preferredFoods,
        allergies,
        healthNotes,
        birthDateKorean,
        familyRoleKorean,
        nickname
      ]);
}

UserInfoStruct createUserInfoStruct({
  String? birthDate,
  FamilyRole? familyRole,
  double? height,
  double? weight,
  double? shoeSize,
  String? clothingSize,
  BloodTypeAbo? bloodTypeAbo,
  BloodTypeRh? bloodTypeRh,
  String? preferredFoods,
  String? allergies,
  String? healthNotes,
  String? birthDateKorean,
  String? familyRoleKorean,
  String? nickname,
}) =>
    UserInfoStruct(
      birthDate: birthDate,
      familyRole: familyRole,
      height: height,
      weight: weight,
      shoeSize: shoeSize,
      clothingSize: clothingSize,
      bloodTypeAbo: bloodTypeAbo,
      bloodTypeRh: bloodTypeRh,
      preferredFoods: preferredFoods,
      allergies: allergies,
      healthNotes: healthNotes,
      birthDateKorean: birthDateKorean,
      familyRoleKorean: familyRoleKorean,
      nickname: nickname,
    );
