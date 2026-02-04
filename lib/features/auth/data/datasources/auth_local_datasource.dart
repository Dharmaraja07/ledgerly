import 'package:isar/isar.dart';
import 'package:ledgerly/features/auth/data/models/user_isar.dart';

class AuthLocalDatasource {
  
  final Isar isar;

  AuthLocalDatasource(this.isar);
  
  Future<void> saveUser(UserIsar user) async{
    await isar.writeTxn(() async{
      await isar.userIsars.clear();
      await isar.userIsars.put(user);
    });
  }
  UserIsar? getUser() {
    return isar.userIsars.where().findFirstSync();
  }
  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.userIsars.clear();
    });
  }
}