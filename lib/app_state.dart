import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _linkId = prefs.getString('ff_linkId') ?? _linkId;
    });
    _safeInit(() {
      _linkUsers = LoggableList(
        prefs
                .getStringList('ff_linkUsers')
                ?.map((x) {
                  try {
                    return LinkUserStruct.fromSerializableMap(jsonDecode(x));
                  } catch (e) {
                    print("Can't decode persisted data type. Error: $e.");
                    return null;
                  }
                })
                .withoutNulls
                .toList() ??
            _linkUsers,
      );
    });
    _safeInit(() {
      _linkUserOthers = LoggableList(
        prefs
                .getStringList('ff_linkUserOthers')
                ?.map((x) {
                  try {
                    return LinkUserStruct.fromSerializableMap(jsonDecode(x));
                  } catch (e) {
                    print("Can't decode persisted data type. Error: $e.");
                    return null;
                  }
                })
                .withoutNulls
                .toList() ??
            _linkUserOthers,
      );
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userInfo')) {
        try {
          final serializedData = prefs.getString('ff_userInfo') ?? '{}';
          _userInfo =
              UserInfoStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _selectedBloodTypeAbo =
          prefs.getString('ff_selectedBloodTypeAbo') ?? _selectedBloodTypeAbo;
    });
    _safeInit(() {
      _selectedBloodTypeRh =
          prefs.getString('ff_selectedBloodTypeRh') ?? _selectedBloodTypeRh;
    });
    _safeInit(() {
      _selectedFamilyRole = prefs.containsKey('ff_selectedFamilyRole')
          ? deserializeEnum<FamilyRole>(
              prefs.getString('ff_selectedFamilyRole'))
          : _selectedFamilyRole;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_authUser')) {
        try {
          final serializedData = prefs.getString('ff_authUser') ?? '{}';
          _authUser =
              AuthUserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _linkId = '';
  String get linkId => _linkId;
  set linkId(String value) {
    _linkId = value;
    prefs.setString('ff_linkId', value);
    debugLogAppState(this);
  }

  late LoggableList<LinkUserStruct> _linkUsers = LoggableList([]);
  List<LinkUserStruct> get linkUsers =>
      _linkUsers?..logger = () => debugLogAppState(this);
  set linkUsers(List<LinkUserStruct> value) {
    if (value != null) {
      _linkUsers = LoggableList(value);
    }

    prefs.setStringList(
        'ff_linkUsers', value.map((x) => x.serialize()).toList());
    debugLogAppState(this);
  }

  void addToLinkUsers(LinkUserStruct value) {
    linkUsers.add(value);
    prefs.setStringList(
        'ff_linkUsers', _linkUsers.map((x) => x.serialize()).toList());
  }

  void removeFromLinkUsers(LinkUserStruct value) {
    linkUsers.remove(value);
    prefs.setStringList(
        'ff_linkUsers', _linkUsers.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLinkUsers(int index) {
    linkUsers.removeAt(index);
    prefs.setStringList(
        'ff_linkUsers', _linkUsers.map((x) => x.serialize()).toList());
  }

  void updateLinkUsersAtIndex(
    int index,
    LinkUserStruct Function(LinkUserStruct) updateFn,
  ) {
    linkUsers[index] = updateFn(_linkUsers[index]);
    prefs.setStringList(
        'ff_linkUsers', _linkUsers.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLinkUsers(int index, LinkUserStruct value) {
    linkUsers.insert(index, value);
    prefs.setStringList(
        'ff_linkUsers', _linkUsers.map((x) => x.serialize()).toList());
  }

  String _linkname = '';
  String get linkname => _linkname;
  set linkname(String value) {
    _linkname = value;

    debugLogAppState(this);
  }

  late LoggableList<LinkUserStruct> _linkUserOthers = LoggableList([]);
  List<LinkUserStruct> get linkUserOthers =>
      _linkUserOthers?..logger = () => debugLogAppState(this);
  set linkUserOthers(List<LinkUserStruct> value) {
    if (value != null) {
      _linkUserOthers = LoggableList(value);
    }

    prefs.setStringList(
        'ff_linkUserOthers', value.map((x) => x.serialize()).toList());
    debugLogAppState(this);
  }

  void addToLinkUserOthers(LinkUserStruct value) {
    linkUserOthers.add(value);
    prefs.setStringList('ff_linkUserOthers',
        _linkUserOthers.map((x) => x.serialize()).toList());
  }

  void removeFromLinkUserOthers(LinkUserStruct value) {
    linkUserOthers.remove(value);
    prefs.setStringList('ff_linkUserOthers',
        _linkUserOthers.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLinkUserOthers(int index) {
    linkUserOthers.removeAt(index);
    prefs.setStringList('ff_linkUserOthers',
        _linkUserOthers.map((x) => x.serialize()).toList());
  }

  void updateLinkUserOthersAtIndex(
    int index,
    LinkUserStruct Function(LinkUserStruct) updateFn,
  ) {
    linkUserOthers[index] = updateFn(_linkUserOthers[index]);
    prefs.setStringList('ff_linkUserOthers',
        _linkUserOthers.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLinkUserOthers(int index, LinkUserStruct value) {
    linkUserOthers.insert(index, value);
    prefs.setStringList('ff_linkUserOthers',
        _linkUserOthers.map((x) => x.serialize()).toList());
  }

  UserInfoStruct _userInfo = UserInfoStruct.fromSerializableMap(jsonDecode(
      '{\"familyRole\":\"NONE\",\"height\":\"0.0\",\"weight\":\"0.0\",\"shoeSize\":\"0.0\",\"clothingSize\":\"0.0\",\"bloodTypeAbo\":\"NONE\",\"bloodTypeRh\":\"NONE\",\"preferredFoods\":\"-\",\"allergies\":\"-\",\"healthNotes\":\"-\"}'));
  UserInfoStruct get userInfo =>
      _userInfo?..logger = () => debugLogAppState(this);
  set userInfo(UserInfoStruct value) {
    _userInfo = value;
    prefs.setString('ff_userInfo', value.serialize());
    debugLogAppState(this);
  }

  void updateUserInfoStruct(Function(UserInfoStruct) updateFn) {
    updateFn(_userInfo);
    prefs.setString('ff_userInfo', _userInfo.serialize());
    debugLogAppState(this);
  }

  String _selectedBloodTypeAbo = '';
  String get selectedBloodTypeAbo => _selectedBloodTypeAbo;
  set selectedBloodTypeAbo(String value) {
    _selectedBloodTypeAbo = value;
    prefs.setString('ff_selectedBloodTypeAbo', value);
    debugLogAppState(this);
  }

  String _selectedBloodTypeRh = '';
  String get selectedBloodTypeRh => _selectedBloodTypeRh;
  set selectedBloodTypeRh(String value) {
    _selectedBloodTypeRh = value;
    prefs.setString('ff_selectedBloodTypeRh', value);
    debugLogAppState(this);
  }

  FamilyRole? _selectedFamilyRole = FamilyRole.SELF;
  FamilyRole? get selectedFamilyRole => _selectedFamilyRole;
  set selectedFamilyRole(FamilyRole? value) {
    _selectedFamilyRole = value;
    value != null
        ? prefs.setString('ff_selectedFamilyRole', value.serialize())
        : prefs.remove('ff_selectedFamilyRole');
    debugLogAppState(this);
  }

  AuthUserStruct _authUser = AuthUserStruct();
  AuthUserStruct get authUser =>
      _authUser?..logger = () => debugLogAppState(this);
  set authUser(AuthUserStruct value) {
    _authUser = value;
    prefs.setString('ff_authUser', value.serialize());
    debugLogAppState(this);
  }

  void updateAuthUserStruct(Function(AuthUserStruct) updateFn) {
    updateFn(_authUser);
    prefs.setString('ff_authUser', _authUser.serialize());
    debugLogAppState(this);
  }

  Map<String, DebugDataField> toDebugSerializableMap() => {
        'linkId': debugSerializeParam(
          linkId,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/dear-link-em0ufw?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChoKEgoGbGlua0lkEghhYzltd2s1M3ICCAN6AFoGbGlua0lk',
          name: 'String',
          nullable: false,
        ),
        'linkUsers': debugSerializeParam(
          linkUsers,
          ParamType.DataStruct,
          isList: true,
          link:
              'https://app.flutterflow.io/project/dear-link-em0ufw?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CjQKFQoJbGlua1VzZXJzEgh6cGd1ZHd3OHIZEgIIFCoTEhEKCExpbmtVc2VyEgVkb2lyMnoAWglsaW5rVXNlcnM=',
          name: 'LinkUser',
          nullable: false,
        ),
        'linkname': debugSerializeParam(
          linkname,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/dear-link-em0ufw?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChwKFAoIbGlua25hbWUSCDZ5bzVsb3c5cgIIA3oAWghsaW5rbmFtZQ==',
          name: 'String',
          nullable: false,
        ),
        'linkUserOthers': debugSerializeParam(
          linkUserOthers,
          ParamType.DataStruct,
          isList: true,
          link:
              'https://app.flutterflow.io/project/dear-link-em0ufw?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CjkKGgoObGlua1VzZXJPdGhlcnMSCG8zYTl3aXYxchkSAggUKhMSEQoITGlua1VzZXISBWRvaXIyegBaDmxpbmtVc2VyT3RoZXJz',
          name: 'LinkUser',
          nullable: false,
        ),
        'userInfo': debugSerializeParam(
          userInfo,
          ParamType.DataStruct,
          link:
              'https://app.flutterflow.io/project/dear-link-em0ufw?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CjEKFAoIdXNlckluZm8SCG5ldzd6a3dmchcIFCoTEhEKCFVzZXJJbmZvEgV1MWtkaHoAWgh1c2VySW5mbw==',
          name: 'UserInfo',
          nullable: false,
        ),
        'selectedBloodTypeAbo': debugSerializeParam(
          selectedBloodTypeAbo,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/dear-link-em0ufw?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CigKIAoUc2VsZWN0ZWRCbG9vZFR5cGVBYm8SCG5uOWxyYXljcgIIA3oAWhRzZWxlY3RlZEJsb29kVHlwZUFibw==',
          name: 'String',
          nullable: false,
        ),
        'selectedBloodTypeRh': debugSerializeParam(
          selectedBloodTypeRh,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/dear-link-em0ufw?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CicKHwoTc2VsZWN0ZWRCbG9vZFR5cGVSaBIIZmhvcXpxa3VyAggDegBaE3NlbGVjdGVkQmxvb2RUeXBlUmg=',
          name: 'String',
          nullable: false,
        ),
        'selectedFamilyRole': debugSerializeParam(
          selectedFamilyRole,
          ParamType.Enum,
          link:
              'https://app.flutterflow.io/project/dear-link-em0ufw?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Cj0KHgoSc2VsZWN0ZWRGYW1pbHlSb2xlEgh6YTdkZGRqcXIZCBsqFRoTCgpGYW1pbHlSb2xlEgVkMjA2MXoAWhJzZWxlY3RlZEZhbWlseVJvbGU=',
          name: 'FamilyRole',
          nullable: false,
        ),
        'authUser': debugSerializeParam(
          authUser,
          ParamType.DataStruct,
          link:
              'https://app.flutterflow.io/project/dear-link-em0ufw?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CjEKFAoIYXV0aFVzZXISCG10MWNxOGhxchcIFCoTEhEKCGF1dGhVc2VyEgUydzBrbHoAWghhdXRoVXNlcg==',
          name: 'authUser',
          nullable: false,
        )
      };
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
