import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dart_appwrite/dart_appwrite.dart' as aws;
import 'package:dart_appwrite/models.dart' as awm;
import 'package:jkmart/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDataSource {
  final Account account;
  final aws.Users users;

  AuthDataSource({required this.account, required this.users});

  final _uniqueId = 'unique()';

  Future<User> createNewUser({required String email, required String password, required String role}) async {
    User createdAccount = await account.create(userId: _uniqueId, email: email, password: password, name: role);

    return createdAccount;
  }

  Future<awm.UserList> getAllUser() async {
    awm.UserList usersList = await users.list();

    return usersList;
  }

  Future<void> loginUser({required String email, required String password}) async {
    final Session session = await account.createEmailSession(email: email, password: password);

    // final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // sharedPreferences.setString(SESSION_ID_KEY, session.$id);
  }

  Future<User> authenticateUser() async {
    final User user = await account.get();

    return user;
  }

  Future<void> logoutUser() async {
    await account.deleteSession(sessionId: 'current');
  }
}
