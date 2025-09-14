import 'package:collection/collection.dart';

enum MainTest {
  id,
  nickname,
  order,
}

enum TargetGroupStatus {
  NONE,
  FAMILY,
  COUPLE,
}

enum FamilyRole {
  FATHER,
  MOTHER,
  SISTER_OLDER_FEMALE,
  SISTER_OLDER_MALE,
  SISTER_YOUNGER,
  BROTHER_OLDER_FEMALE,
  BROTHER_OLDER_MALE,
  BROTHER_YOUNGER,
  DAUGHTER,
  SON,
  NONE,
  SELF,
  COUPLE,
}

enum BloodTypeAbo {
  A,
  B,
  O,
  AB,
  NONE,
}

enum BloodTypeRh {
  POSITIVE,
  NEGATIVE,
  NONE,
}

enum TargetGroup {
  A,
  B,
  C,
  D,
  NONE,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (MainTest):
      return MainTest.values.deserialize(value) as T?;
    case (TargetGroupStatus):
      return TargetGroupStatus.values.deserialize(value) as T?;
    case (FamilyRole):
      return FamilyRole.values.deserialize(value) as T?;
    case (BloodTypeAbo):
      return BloodTypeAbo.values.deserialize(value) as T?;
    case (BloodTypeRh):
      return BloodTypeRh.values.deserialize(value) as T?;
    case (TargetGroup):
      return TargetGroup.values.deserialize(value) as T?;
    default:
      return null;
  }
}
