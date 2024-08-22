import 'package:madh/data/model/auth/create_user_req.dart';
import 'package:madh/data/sources/auth/auth_firebase_service.dart';
import 'package:madh/domain/repository/auth/auth.dart';
import 'package:madh/service_locator.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(CreateUserReq createUserReg) async {
    await s1<AuthFirebaseService>().signUp(createUserReg);
  }
}
