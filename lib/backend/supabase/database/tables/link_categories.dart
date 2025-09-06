import '../database.dart';

class LinkCategoriesTable extends SupabaseTable<LinkCategoriesRow> {
  @override
  String get tableName => 'link_categories';

  @override
  LinkCategoriesRow createRow(Map<String, dynamic> data) =>
      LinkCategoriesRow(data);
}

class LinkCategoriesRow extends SupabaseDataRow {
  LinkCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LinkCategoriesTable();

  int get linkId => getField<int>('link_id')!;
  set linkId(int value) => setField<int>('link_id', value);

  int get categoryId => getField<int>('category_id')!;
  set categoryId(int value) => setField<int>('category_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
