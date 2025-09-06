import '../database.dart';

class LinkUsersTable extends SupabaseTable<LinkUsersRow> {
  @override
  String get tableName => 'link_users';

  @override
  LinkUsersRow createRow(Map<String, dynamic> data) => LinkUsersRow(data);
}

class LinkUsersRow extends SupabaseDataRow {
  LinkUsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LinkUsersTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get linkId => getField<int>('link_id')!;
  set linkId(int value) => setField<int>('link_id', value);

  String? get nickname => getField<String>('nickname');
  set nickname(String? value) => setField<String>('nickname', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get profileImageUrl => getField<String>('profile_image_url');
  set profileImageUrl(String? value) =>
      setField<String>('profile_image_url', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
