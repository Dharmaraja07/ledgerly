import 'package:isar/isar.dart';

part 'category_isar.g.dart';

@collection
class CategoryIsar {
  Id id = Isar.autoIncrement;

  late String name;
  late int iconCode;
  late int colorValue;
  
  bool isDefault = false;
}
