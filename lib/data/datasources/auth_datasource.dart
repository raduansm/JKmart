import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:jkmart/data/models/user_model.dart';

class AuthDataSource {
  final Account account;

  AuthDataSource({required this.account});

  final _uniqueId = 'unique()';

  Future<User> createNewUser({required String email, required String password, required String role}) async {
    User createdAccount = await account.create(userId: _uniqueId, email: email, password: password, name: role);

    return createdAccount;
  }
}
