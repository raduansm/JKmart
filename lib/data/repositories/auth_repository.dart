import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dart_appwrite/models.dart' as awm;
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

  Future<Either<Failure, awm.UserList>> getUsers() async {
    if (await networkInfo.isConnected) {
      try {
        final awm.UserList userList = await dataSource.getAllUser();
        return Right(userList);
      } on AppwriteException catch (e) {
        print(e.message);
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  Future<Either<Failure, void>> loginUser({required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        await dataSource.loginUser(email: email, password: password);
        return const Right(null);
      } on AppwriteException catch (e) {
        print(e.message);
        if (e.code! >= 400) {
          return Left(LoginFailure());
        }
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  Future<Either<Failure, User>> authenticateUser() async {
    if (await networkInfo.isConnected) {
      try {
        final User user = await dataSource.authenticateUser();
        return Right(user);
      } on AppwriteException catch (e) {
        print(e.message);
        if (e.code! >= 400) {
          return Left(AuthenticationFailure());
        }
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  Future<Either<Failure, void>> logoutUser() async {
    if (await networkInfo.isConnected) {
      try {
        await dataSource.logoutUser();
        return const Right(null);
      } on AppwriteException catch (e) {
        print(e.message);
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
