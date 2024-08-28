import 'package:dartz/dartz.dart';
import 'package:madh/core/usecase/usecase.dart';
import 'package:madh/data/model/auth/create_user_req.dart';
import 'package:madh/domain/repository/auth/auth.dart';
import 'package:madh/service_locator.dart';

class SignUpUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    return s1<AuthRepository>().signUp(params!);
  }
}
