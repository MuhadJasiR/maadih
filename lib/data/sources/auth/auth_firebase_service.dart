import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:madh/data/model/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<void> signUp(CreateUserReq createUserReq);
  Future<void> signIn();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
    } on FirebaseException {}
  }
}
