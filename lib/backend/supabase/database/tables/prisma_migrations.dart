import '../database.dart';

class PrismaMigrationsTable extends SupabaseTable<PrismaMigrationsRow> {
  @override
  String get tableName => '_prisma_migrations';

  @override
  PrismaMigrationsRow createRow(Map<String, dynamic> data) =>
      PrismaMigrationsRow(data);
}

class PrismaMigrationsRow extends SupabaseDataRow {
  PrismaMigrationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PrismaMigrationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get checksum => getField<String>('checksum')!;
  set checksum(String value) => setField<String>('checksum', value);

  DateTime? get finishedAt => getField<DateTime>('finished_at');
  set finishedAt(DateTime? value) => setField<DateTime>('finished_at', value);

  String get migrationName => getField<String>('migration_name')!;
  set migrationName(String value) => setField<String>('migration_name', value);

  String? get logs => getField<String>('logs');
  set logs(String? value) => setField<String>('logs', value);

  DateTime? get rolledBackAt => getField<DateTime>('rolled_back_at');
  set rolledBackAt(DateTime? value) =>
      setField<DateTime>('rolled_back_at', value);

  DateTime get startedAt => getField<DateTime>('started_at')!;
  set startedAt(DateTime value) => setField<DateTime>('started_at', value);

  int get appliedStepsCount => getField<int>('applied_steps_count')!;
  set appliedStepsCount(int value) =>
      setField<int>('applied_steps_count', value);
}
