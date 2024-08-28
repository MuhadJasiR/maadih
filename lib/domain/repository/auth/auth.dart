import 'package:dartz/dartz.dart';
import 'package:madh/data/model/auth/create_user_req.dart';
import 'package:madh/data/model/auth/sign_in_user_req.dart';

abstract class AuthRepository {
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<Either> signIn(SignInUserReq signInUserReq);
}
