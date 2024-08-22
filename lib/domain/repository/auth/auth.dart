import 'package:madh/data/model/auth/create_user_req.dart';

abstract class AuthRepository {
  Future<void> signUp(CreateUserReq createUserReq);
  Future<void> signIn();
}
