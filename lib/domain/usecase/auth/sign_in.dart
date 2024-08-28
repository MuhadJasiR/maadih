import 'package:dartz/dartz.dart';
import 'package:madh/core/usecase/usecase.dart';
import 'package:madh/data/model/auth/sign_in_user_req.dart';
import 'package:madh/domain/repository/auth/auth.dart';
import 'package:madh/service_locator.dart';

class SignInUseCase implements UseCase<Either, SignInUserReq> {
  @override
  Future<Either> call({SignInUserReq? params}) {
    return s1<AuthRepository>().signIn(params!);
  }
}
