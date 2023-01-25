import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/core/network/network_info.dart';
import 'package:jkmart/data/datasources/auth_datasource.dart';

class AuthRepository {
  final AuthDataSource dataSource;
  final NetworkInfo networkInfo;

  AuthRepository({required this.dataSource, required this.networkInfo});

  Future<Either<Failure, User>> createNewUser({required String email, required String password, required String role}) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await dataSource.createNewUser(email: email, password: password, role: role);
        return Right(user);
      } on AppwriteException catch (e) {
        print(e.message);
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
