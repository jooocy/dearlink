import '../database.dart';

class InviteCodesTable extends SupabaseTable<InviteCodesRow> {
  @override
  String get tableName => 'invite_codes';

  @override
  InviteCodesRow createRow(Map<String, dynamic> data) => InviteCodesRow(data);
}

class InviteCodesRow extends SupabaseDataRow {
  InviteCodesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InviteCodesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get code => getField<String>('code')!;
  set code(String value) => setField<String>('code', value);

  int get linkId => getField<int>('link_id')!;
  set linkId(int value) => setField<int>('link_id', value);

  String get createdBy => getField<String>('created_by')!;
  set createdBy(String value) => setField<String>('created_by', value);

  int get maxUses => getField<int>('max_uses')!;
  set maxUses(int value) => setField<int>('max_uses', value);

  int get usedCount => getField<int>('used_count')!;
  set usedCount(int value) => setField<int>('used_count', value);

  DateTime? get expiresAt => getField<DateTime>('expires_at');
  set expiresAt(DateTime? value) => setField<DateTime>('expires_at', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
