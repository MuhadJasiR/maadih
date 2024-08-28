import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:madh/data/model/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<void> signIn();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      return const Right("SignUp was Success");
    } on FirebaseException catch (e) {
      String message = "";
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == "email-already-in-use") {
        message = 'The account already exists for that email.';
      }
      return Left(message);
    }
  }
}
