import 'package:dartz/dartz.dart';
import 'package:madh/data/model/auth/create_user_req.dart';

abstract class AuthRepository {
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<void> signIn();
}
