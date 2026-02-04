import 'package:isar/isar.dart';
part 'user_isar.g.dart';
@collection
class UserIsar {
  Id id = Isar.autoIncrement;
  late String userId;
  late String email;
  late String name;

  late String accessToken;
  late String refreshToken;
}