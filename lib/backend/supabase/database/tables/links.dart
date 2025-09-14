import '../database.dart';

class LinksTable extends SupabaseTable<LinksRow> {
  @override
  String get tableName => 'links';

  @override
  LinksRow createRow(Map<String, dynamic> data) => LinksRow(data);
}

class LinksRow extends SupabaseDataRow {
  LinksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LinksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get password => getField<String>('password');
  set password(String? value) => setField<String>('password', value);

  String? get coverImageUrl => getField<String>('cover_image_url');
  set coverImageUrl(String? value) =>
      setField<String>('cover_image_url', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
