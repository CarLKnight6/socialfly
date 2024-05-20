import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_fly/controllers/interfaces/auth.dart';
import 'package:social_fly/models/failure.dart';

class AuthController implements IAuthController {
  @override
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, bool>> signInWithEmail(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return Left(Failure(message: 'No user found'));
        case 'wrong-password':
          return Left(Failure(message: 'Password is incorrect'));
        case 'invalid-email':
          return Left(Failure(message: 'Email address not valid'));
        case 'invalid-credential':
          return Left(Failure(message: 'Invalid credential'));
        case 'INVALID_LOGIN_CREDENTIALS':
          return Left(Failure(message: 'Password is incorrect'));
        default:
          return Left(Failure(message: e.code));
      }
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      await auth.signOut();
      return const Right(true);
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> signUpWithEmail(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'unknown':
          return Left(Failure(message: 'Error signing up'));
        case 'email-already-in-use':
          return Left(Failure(message: 'Email already in use'));
        default:
          return Left(Failure(message: e.code));
      }
    }
  }
}
