import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:madh/data/model/auth/create_user_req.dart';
import 'package:madh/data/model/auth/sign_in_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either<String, String>> signUp(CreateUserReq createUserReq);
  Future<Either<String, String>> signIn(SignInUserReq signInUserReq);
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either<String, String>> signIn(SignInUserReq signInUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInUserReq.email,
        password: signInUserReq.password,
      );
      return const Right("SignIn was Success");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == 'user-not-found') {
        message = 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user';
      }
      log(message);
      return Left(message);
    } catch (e) {
      return const Left('An unknown error occurred. Please try again later.');
    }
  }

  @override
  Future<Either<String, String>> signUp(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      FirebaseFirestore.instance.collection("Users").add({
        "name": createUserReq.fullName,
        "email": data.user?.email,
      });
      return const Right("SignUp was Success");
    } on FirebaseAuthException catch (e) {
      String message = "";
      log(e.message.toString());
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email';
      }
      log(message);
      return Left(message);
    } catch (e) {
      return const Left('An unknown error occurred. Please try again later.');
    }
  }
}
